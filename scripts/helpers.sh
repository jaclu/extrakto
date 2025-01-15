#!/bin/sh

#
#  I use an env var TMUX_BIN to point at the tmux version to use.
#  This is needed when checking backward compatibility with various versions.
#  If not found, it is set to whatever is in the path, so should have no negative
#  impact. In all calls to tmux I use $TMUX_BIN instead in the rest of this
#  plugin.
#
[ -z "$TMUX_BIN" ] && TMUX_BIN="tmux"

get_option() {
	option=$1
	default_value=$2
	option_value=$($TMUX_BIN show-option -gqv "$option" 2>/dev/null)

	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}
