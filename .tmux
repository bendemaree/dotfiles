# powerline
set-option -g status on
set-option -g status-interval 2
set-option -g status-utf8 on
set-option -g status-justify "left"
set-option -g status-right-length 150
set-option -g status-right "#(/Users/Shared/Benjamin/.tmuxp/status-right.sh)"

# C-a instead of C-b
set-option -g prefix C-a
bind-key C-a last-window

# start window numbering at 1
set -g base-index 1
set -g pane-base-index 1

# faster key repetition
set -s escape-time 0

# maximum client size
setw -g aggressive-resize on

# pass commands to nested tmux using "a" prefix
bind-key a send-prefix

# activity monitoring
#setw -g monitor-activity on
#set -g visual-activity on

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

# use the vim resize keys
bind > resize-pane -R 5
bind < resize-pane -L 5
bind - resize-pane -D 5
bind + resize-pane -U 5

# shell
set-option -g default-shell /bin/zsh
