# spotlight: Search for a file using MacOS Spotlight's metadata
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

# httpDebug:  Download a web page and show info on what took time
httpdebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }

# Make and cd into dir
function mcd() {
  mkdir -p "$1" && cd "$1";
}

# shorthand find 
function f() {
  find . -name "$1"
}

function markdown() {
  pandoc "$1" | lynx -stdin -vikeys
}

# Docker
function dkr() {
  docker exec -it "$1"
}

# Override rm (move it to trash)
# It will save me one day
function del () {
  local path
  for path in "$@"; do
    # ignore any arguments
    if [[ "$path" = -* ]]; then :
    else
      local dst=${path##*/}
      # append the time if necessary
      while [ -e ~/.Trash/"$dst" ]; do
        dst="`expr "$dst" : '\(.*\)\.[^.]*'` `date +%H-%M-%S`.`expr "$dst" : '.*\.\([^.]*\)'`"
      done
      mv "$path" ~/.Trash/"$dst"
    fi
  done
}

# Google Translate API
# https://github.com/soimort/google-translate-cli
fr () {
  X=`trans :fr "$1"`;
#  echo "$X" | pbcopy;
  echo "$X";
}

nl () {
  X=`trans nl "$1"`;
  echo "$X";
}

nlen () {
  X=`trans nl:en "$1"`;
  echo "$X";
}

# Convert screen recordings to gif image
# https://gist.github.com/SlexAxton/4989674
gifify() {
  if [[ -n "$1" ]]; then
    if [[ $2 == '--good' ]]; then
      ffmpeg -i $1 -r 10 -vcodec png out-static-%05d.png
      time convert -verbose +dither -layers Optimize -resize 600x600\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > $1.gif
      rm out-static*.png
    else
      ffmpeg -i $1 -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > $1.gif
    fi
  else
    echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}

chkinvalidation() {
  if which aws >/dev/null; then
    if [[ -n "$1" ]]; then
      local STATUS
      local ID=$1
      checkStatus() {
        STATUS="$(aws cloudfront get-invalidation --distribution-id E18TOH3LDCP8AO --id $ID | sed -n 's/.*"Status": "\(.*\)",/\1/p')"
        sleep 20
        echo $STATUS
      }
      checkStatus
      while [ "$STATUS" != "Completed " ]; do
        checkStatus
      done
      osascript -e 'display notification "Invalidation for object:'${ID}' complete." with title "Invalidation complete!"'
      echo "Invalidation completed!"
    else
      echo "Fool! Requires an invalidationID to check progress." 
    fi
  else
    echo "You need the aws cli tool installed"
    echo "Run $ pip install awscli"
  fi
}
