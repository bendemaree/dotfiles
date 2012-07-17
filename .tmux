# Use C-a instead of C-b
set-option -g prefix C-a
bind-key C-a last-window

# Start window numbering at 1
set -g base-index 1
set -g pane-base-index 1

# Allows for faster key repetition
set -s escape-time 0

# Set status bar
set -g status-bg blue 
set -g status-fg white
set -g status-left "#[fg=white]#H"
set -g status-right "#[fg=yellow]#(uptime | cut -d ',' -f 4-)"

# Size window to maximum client size
setw -g aggressive-resize on

# Pass commands to nested tmux using "a" prefix
bind-key a send-prefix

# Activity monitoring
#setw -g monitor-activity on
#set -g visual-activity on

# Highlight active window
set-window-option -g window-status-current-bg red

# use "v" and "s" to do vertical/horizontal splits, like vim
bind s split-window -v
bind v split-window -h

# use the vim motion keys to move between panes
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# use vim motion keys while in copy mode
setw -g mode-keys vi
# use the vim resize keys.
# the number at the end is how much the pane will be resized,
# and 1 is fairly small -- you might want to tweak this.
bind > resize-pane -R 5
bind < resize-pane -L 5
bind - resize-pane -D 5
bind + resize-pane -U 5

set-option -g default-shell /bin/zsh
