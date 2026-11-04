# extrakto help

You can give feedback or star extrakto at <https://github.com/laktak/extrakto>

Extrakto uses fzf. You only need to type a few keys to find your selection with a fuzzy match.

- Press _ctrl-f_ to change to the next filter mode (_filter_key_)
  - _word_, the default filter allows you to select words (default min length=5)
  - _all_, runs all(\*) filters and allows you select quotes, url, paths, etc. \
    You can define your own filters as well as selecting which are included in \
    the all selection (see extrakto.conf).
  - _line_, select full lines

- Press _ctrl-g_ to change the grab area (see _grab_key_ and configuration)
  - _full_, everything from the current pane
  - _window full_, everything from all panes in this window
  - _recent_, everything visible with a few lines from the history (current pane)
  - _window recent_, everything visible with a few lines from the history (window)

- Press _esc_ or _ctrl-c_ to cancel

- Use _shift-tab_ to select multiple entries.

Actions that use the current selection:

- Press _tab_ to insert the selection into the active tmux pane (_insert_key_).

- Press _enter_ to copy the selection to the clipboard (_copy_key_).

- Press _ctrl-o_ to pass the selection to the _open_ command of your OS (_open_key_). \
  For example if you select a URL this will open the browser.

- Press _ctrl-e_ to open the selection in your $EDITOR (_edit_key_). \
  This only makes sense if you select a path and if you are currently in a shell. \
  extrakto will send the command to launch the editor to your active pane.

You can change most keys, define your own filters and change other configuration options.
Please see the GitHub readme for instructions.
