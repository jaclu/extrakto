#!/usr/bin/env bash

BASE_PATH_E="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# shellcheck source=/dev/null
source "$BASE_PATH_E"/scripts/tmux-plugin-tools.sh
tpt_dependency_check "fzf|sk" || exit 1

source "$BASE_PATH_E/scripts/helpers.sh"

extrakto_open="$BASE_PATH_E/scripts/open.sh"
extrakto_key=$(get_option "@extrakto_key" "tab")

lowercase_key=$(echo "$extrakto_key"x | tr '[:upper:]' '[:lower:]')

if [[ "$lowercase_key" != "none" ]]; then
    $TMUX_BIN bind-key "${extrakto_key}" run-shell "\"$extrakto_open\" \"#{pane_id}\""
fi
