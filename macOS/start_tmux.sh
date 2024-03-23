#!/bin/bash
echo "Debug: Starting tmux setup..."
tmux new-session -d -s mySession
tmux split-window -h
tmux select-pane -t 0
tmux split-window -v
tmux select-pane -t 2
tmux split-window -v
echo "Debug: tmux setup complete."
tmux attach-session -t mySession
