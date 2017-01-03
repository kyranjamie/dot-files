#
# Load and configure escaped colour globals
autoload -U colors && colors
reset="%{${reset_color}%}"
white="%{$fg[white]%}"
gray="%{$fg[black]%}"
green="%{$fg[green]%}"
red="%{$fg[red]%}"
yellow="%{$fg[yellow]%}"
magenta="%{$fg[magenta]%}"

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"
GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"
GIT_PROMPT_STASHED="%{$fg[magenta]%}SNUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg[magenta]%}⚡︎%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg[red]%}●%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg[yellow]%}●%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg[green]%}●%{$reset_color%}"

# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
parse_git_state() {

  # Compose this value via multiple conditional appends.
  local GIT_STATE=""

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi

  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi

  local STASHES="$(git stash list 2>/dev/null | wc -l | tr -d ' ')"
  if [ "$STASHES" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_STASHED//NUM/$STASHES}
  fi

  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi
}

# If inside a Git repository, print its branch and state
git_prompt_string() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && print "$GIT_PROMPT_SYMBOL$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[yellow]%}%{%B%}${git_where#(refs/heads/|tags/)}%{%b%}$GIT_PROMPT_SUFFIX"
}

check_unused_alias() {
  # Previous cmd
  local command=$history[$[HISTCMD-1]]
  # Loop keys for matching command
  for c in ${(k)aliases[(R)$command]}; do 
    echo "\nYou typed $fg[red]$command$reset_color but you could have typed $fg[green]$c$reset_color"
  done
}

# Execute before every cmd
precmd() {

  # Set directory name as tab title
  echo -ne "\033]0;${PWD##*/}\007"

  check_unused_alias

  # Calculation to pad git status message over to the right of the prompt
  PROMPT_NAME="$red%{%B%}%n%{%b%}$reset"
  PROMPT_DIR="$yellow%{%B%}${PWD/#$HOME/~}%{%b%}$reset"
  local i_left
  local i_right
  local left
  local right
  local padding
  local filler
  left="${PROMPT_NAME} ${grey}in${reset} ${PROMPT_DIR}"
  right="$(git_prompt_string)"
  # string with no escapes
  i_left=${(S)left//\%\{*\%\}}
  i_right=${(S)right//\%\{*\%\}}
  # visible string length
  i_left=${#${(%)i_left}}
  i_right=${#${(%)i_right}}
  # buffer width - prompt text
  padding=$(( $COLUMNS - $i_left - $i_right ))
  filler="${gray}${(l:${padding}:::)}${reset}"
  print -P $left${filler}$right
}

PS1="❯ "
