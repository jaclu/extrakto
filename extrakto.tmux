#!/usr/bin/env bash

BASE_PATH_E="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
f_missing_dependeny="$BASE_PATH_E"/.missing_dependeny

if ! command -v fzf >/dev/null && ! command -v sk >/dev/null; then
    # If dependency ruby not found, flag this issue, display error, then abort
    touch "$f_missing_dependeny"
fi

source "$BASE_PATH_E/scripts/helpers.sh"

extrakto_open="$BASE_PATH_E/scripts/open.sh"
extrakto_key=$(get_option "@extrakto_key" "tab")

lowercase_key=$(echo "$extrakto_key"x | tr '[:upper:]' '[:lower:]')

if [[ "$lowercase_key" != "none" ]]; then
    $TMUX_BIN bind-key "${extrakto_key}" run-shell "\"$extrakto_open\" \"#{pane_id}\""
fi
