#!/usr/bin/env bash

# BASE_PATH_E="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASE_PATH_E="$( dirname "$( dirname "$( realpath "${BASH_SOURCE[0]}" )")")"

source "$BASE_PATH_E"/scripts/helpers.sh


extrakto="$BASE_PATH_E"/extrakto_plugin.py

pane_id=$1
split_direction=$(get_option "@extrakto_split_direction" "a")

if [[ "$split_direction" = "a" ]]; then
        if [[ -n "$($TMUX_BIN list-commands popup 2>/dev/null)" ]]; then
                split_direction="p"
        else
                split_direction="v"
        fi
fi

extra_options=""
if [[ -n "$2" ]]; then
        # requires tmux 3.3 * Add -e flag to set an environment variable for a popup.
        extra_options="-e extrakto_inital_mode=$2"
fi

if [[ "$split_direction" = "p" ]]; then
    popup_size=$(get_option "@extrakto_popup_size" "90%")
    popup_width=$(echo "$popup_size" | cut -d',' -f1)
    popup_height=$(echo "$popup_size" | cut -d',' -f2)

    popup_position=$(get_option "@extrakto_popup_position" "C")
    popup_x=$(echo "$popup_position" | cut -d',' -f1)
    popup_y=$(echo "$popup_position" | cut -d',' -f2)
    rc=129
    while [[ $rc -eq 129 ]]; do
        # shellcheck disable=SC2086
        $TMUX_BIN popup \
                  -w "${popup_width}" \
                  -h "${popup_height:-${popup_width}}" \
                  -x "${popup_x}" \
                  -y "${popup_y:-$popup_x}" \
                  $extra_options \
                  -E "${extrakto} ${pane_id} popup"
        rc=$?
    done
    exit "$rc"
else
    split_size=$(get_option "@extrakto_split_size" 7)
    # shellcheck disable=SC2086
    $TMUX_BIN split-window \
              -"${split_direction}" \
              $extra_options \
              -l ${split_size} "$TMUX_BIN setw remain-on-exit off; ${extrakto} ${pane_id} split"
fi
