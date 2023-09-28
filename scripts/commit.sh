#!/bin/bash

input() {
  gum input \
    --placeholder "$1" \
    --value "$2"
}

if [[ -z `git status -s -uno | grep -v "^ " | awk '{print $2}'` ]]; then
  gum confirm "Stage all?" && git add .
fi

choices=(
  "fix"
  "feat"
  "docs"
  "style"
  "refactor"
  "test"
  "chore"
  "revert"
)
type=`gum choose ${choices[@]}`
scope=`input "scope"`

if [[ -n "$scope" ]]; then
  scope="(${scope})"
fi

summary=`input "Summary of this change" "${type}${scope}: "`
desc=`gum write --placeholder "Details of this change"`

if [[ `gum confirm "Confirm changes?"` ]]; then
  git commit -m "$summary" -m "$desc"
fi
