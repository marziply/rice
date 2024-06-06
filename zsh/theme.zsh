# vi: ft=sh

#!/bin/zsh

local ret_status="%(?:%{${fg_bold[green]}%}:%{${fg_bold[red]}%})%?%{${reset_color}%}"
local current_dir="%{${terminfo[bold]}${fg[blue]}%}%~ %{${reset_color}%}"

function prompt() {
  echo "╭─ ${ret_status} : ${current_dir}$(git_prompt_info)"
  echo "╰─ %B$%b "
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{${fg[yellow]}%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{${reset_color}%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{${fg_bold[magenta]}%}↑"
ZSH_THEME_GIT_PROMPT_BEHIND="%{${fg_bold[green]}%}↓"
ZSH_THEME_GIT_PROMPT_STAGED="%{${fg_bold[green]}%}●"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{${fg_bold[red]}%}●"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{${fg_bold[white]}%}●"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{${fg_bold[red]}%}✕"

PROMPT=$'$(prompt)'
