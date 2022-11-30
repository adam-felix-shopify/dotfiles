export CLICOLOR=1
export LSCOLORS="DxBxHxCxCxDBEdxbxgxcxd"

alias ll='ls -alFGh'

alias rm='rm -i'
alias scp='scp -i'
alias mv='mv -i'

set -o noclobber
set -o vi

autoload -U compinit
compinit -i

autoload -Uz add-zsh-hook
setopt prompt_subst
add-zsh-hook precmd vcs_info

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

# Echoes a username/host string when connected over SSH (empty otherwise)
ssh_info() {
  [[ "$SSH_CONNECTION" != '' ]] && echo '%(!.%{$fg[red]%}.%{$fg[yellow]%})%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}:' || echo ''
}

# Echoes information about Git repository status when inside a Git repository
git_info() {

  # Exit if not inside a Git repository
  ! git rev-parse --is-inside-work-tree > /dev/null 2>&1 && return

  # Git branch/tag, or name-rev if on detached head
  local GIT_LOCATION=${$(git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD)#(refs/heads/|tags/)}

  local AHEAD="%{$fg[red]%}⇡NUM%{$reset_color%}"
  local BEHIND="%{$fg[cyan]%}⇣NUM%{$reset_color%}"
  local MERGING="%{$fg[magenta]%}⚡︎%{$reset_color%}"
  local UNTRACKED="%{$fg[magenta]%}$(for n in {1..$(git ls-files --others --exclude-standard | wc -l | xargs)}; do echo -n '●'; done)%{$reset_color%}"
  local MODIFIED="%{$fg[green]%}$(for n in {1..$(git diff --name-only | wc -l | xargs)}; do echo -n '●'; done)%{$reset_color%}"
  local STAGED="%{$fg[yellow]%}$(for n in {1..$(git diff --staged --name-only | wc -l | xargs)}; do echo -n '●'; done)%{$reset_color%}"

  local -a DIVERGENCES
  local -a FLAGS

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    DIVERGENCES+=( " ${AHEAD//NUM/$NUM_AHEAD} " )
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    DIVERGENCES+=( " ${BEHIND//NUM/$NUM_BEHIND} " )
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    FLAGS+=( "$MERGING" )
  fi

  local NUM_GIT_UNTRACKED="$(git status -uall)"
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    FLAGS+=( "$UNTRACKED" )
  fi

  if ! git diff --quiet 2> /dev/null; then
    FLAGS+=( "$MODIFIED" )
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    FLAGS+=( "$STAGED" )
  fi

  local -a GIT_INFO
  GIT_INFO+=( "::%{$reset_color%}" )
  [ -n "$GIT_STATUS" ] && GIT_INFO+=( "$GIT_STATUS" )
  [[ ${#DIVERGENCES[@]} -ne 0 ]] && GIT_INFO+=( "${(j::)DIVERGENCES}" )
  [[ ${#FLAGS[@]} -ne 0 ]] && GIT_INFO+=( " ${(j::)FLAGS}" )
  GIT_INFO+=( " %B%{$fg[green]%}$GIT_LOCATION%{$reset_color%}%b" )
  echo "${(j::)GIT_INFO}"
}

function insert-mode () { echo "%K{015} %F{033}%BINSERT%b%f %k" }
function normal-mode () { echo "%K{040} %F{022}%BNORMAL%b%f %k" }
function visual-mode () { echo "%K{166} %F{088}%BVISUAL%b%f %k" }
function operator-mode () { echo "%F{229}%BOPERATOR-PENDING%b%f" }

function set-prompt () {
    case ${KEYMAP} in
      (vicmd)      VI_MODE="$(normal-mode)"   ;;
      (main|viins) VI_MODE="$(insert-mode)"   ;;
      (viopp)      VI_MODE="$(operator-mode)" ;;
      (*)          VI_MODE="$(insert-mode)"   ;;
    esac

PROMPT='$(ssh_info)%B%{$fg[blue]%D{%c}%}%{$reset_color%}%b :: %B%F{055}%n%f%b :: %B%{$fg[magenta]%}%~%u%b %{$fg[red]%}%{$reset_color%}$(git_info)%{$reset_color%}
$(echo $VI_MODE) %(?.%{$fg[blue]%}.%{$fg[red]%})%(!.#.)%{$reset_color%} '
}

function zle-line-init zle-keymap-select {
    set-prompt
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
