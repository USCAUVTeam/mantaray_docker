#!/bin/bash
# start-tmux.sh

# Start tmux session named 'mySession' detached
tmux new-session -d -s mySession

# Split the window into two panes vertically
tmux split-window -h

# Select the first pane to split horizontally
tmux select-pane -t 0
tmux split-window -v

# Select the new second pane (right top) to split horizontally as well
tmux select-pane -t 2
tmux split-window -v
