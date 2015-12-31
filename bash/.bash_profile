# ENV variables
export PATH="/usr/local/bin:/Users/kyran/Dropbox/tech/scripts:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="/opt/local/sbin:$PATH"
export PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:$PATH"
export PATH="/usr/local/php5/bin:$PATH"
export PATH

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home
export GOPATH="$HOME/.go"
export IPLAYER_OUTDIR="Documents/iplayer/"

export USABILLA_PROJECTS="projects"
export UBJS="projects/infrastructure/reverse/usabilla.js/usabilla.js"


# Sets to vim mode
export EDITOR='vim'
export BLOCKSIZE=1k

for file in ~/.{aliases,functions,bash_prompt}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Autocomplete awscli
complete -C aws_completer aws

# Check for and run git autocompletion
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
if [ -f ~/.git-completion ]; then
  . ~/.git-completion

  # Add git completion to aliases
  __git_complete g __git_main
  __git_complete gco _git_checkout
  __git_complete gm _git_merge
  __git_complete gp _git_push
  __git_complete gpl _git_pull
fi

source ~/.bin/arcanist/resources/shell/bash-completion

source ~/.nvm/nvm.sh

# init z 
# https://github.com/rupa/z
# installed with brew
. /usr/local/Cellar/z/1.8/etc/profile.d/z.sh
