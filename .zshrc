alias ll='ls -alFGh'
alias rm='rm -i'
alias mv='mv -i'

set -o noclobber
set -o vi

autoload -U compinit
compinit -i

autoload -Uz add-zsh-hook
setopt prompt_subst
add-zsh-hook precmd vcs_info

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

    # my own cool powerline prompt
    PROMPT="$(echo $VI_MODE) %B%F{130}%D{%c}%f %F{#000000}::%f %F{055}%B%n%b%f %F{#000000#}->%f %F{088}%B%~%b%f%b
>>= "
}

function zle-line-init zle-keymap-select {
    set-prompt
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

PROMPT="%B%F{130}%D{%c}%f %F{#000000}::%f %F{055}%n%f %F{#000000#}->%f %F{088}%~%f%b
>>= "
RPROMPT='%B${vcs_info_msg_0_} %b'

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%K{093}%F{229}%Udirty files%u%f%k %F{093}::%f '
zstyle ':vcs_info:*' stagedstr '%K{064}%F{229}%Ustaged changes%u%f%k %F{093}::%f '
zstyle ':vcs_info:git:*' formats '%u%c%F{093}%b%f'
zstyle ':vcs_info:git:*' actionformats '%K{001}%F{229}%a%f%k %F{093}::%f %u%c%F{093}%b%f'
