#!/Users/Shared/Benjamin/homebrew/bin/bash
# This script prints a string will be evaluated for text attributes (but not shell commands) by tmux. It consists of a bunch of segments that are simple shell scripts/programs that output the information to show. For each segment the desired foreground and background color can be specified as well as what separator to use. The script the glues together these segments dynamically so that if one script suddenly does not output anything (= nothing should be shown) the separator colors will be nicely handled.

# The powerline root directory.
cwd=$(dirname $0)

# Source global configurations.
source "${cwd}/config.sh"

# Source lib functions.
source "${cwd}/lib.sh"

segments_path="${cwd}/${segments_dir}"

# Segment
# Comment/uncomment the register function call to enable or disable a segment.

declare -A now_playing
if [ "$PLATFORM" == "linux" ]; then
	now_playing+=(["script"]="${segments_path}/np_mpd.sh")
	#now_playing+=(["script"]="${segments_path}/np_spotify_linux_wine.sh")
	#now_playing+=(["script"]="${segments_path}/np_spotify_linux_native.sh")
	#now_playing+=(["script"]="${segments_path}/np_rhythmbox.sh")
	#now_playing+=(["script"]="${segments_path}/np_banshee.sh")
	#now_playing+=(["script"]="${segments_path}/np_audacious.sh")
elif [ "$PLATFORM" == "mac" ]; then
	#now_playing+=(["script"]="${segments_path}/np_itunes_mac.sh")
	now_playing+=(["script"]="${segments_path}/np_spotify_mac.sh")
fi
if [[ ${now_playing["script"]} ]]; then
        now_playing+=(["foreground"]="colour37")
        now_playing+=(["background"]="colour234")
        now_playing+=(["separator"]="${separator_left_bold}")
        register_segment "now_playing"
fi

declare -A weather
weather+=(["script"]="${segments_path}/weather.sh")
weather+=(["foreground"]="colour255")
weather+=(["background"]="colour37")
weather+=(["separator"]="${separator_left_bold}")
register_segment "weather"

declare -A hostname
hostname+=(["script"]="${segments_path}/hostname.sh")
hostname+=(["foreground"]="colour0")
hostname+=(["background"]="colour33")
hostname+=(["separator"]="${separator_left_bold}")
register_segment "hostname"

declare -A wan_ip
wan_ip+=(["script"]="${segments_path}/wan_ip.sh")
wan_ip+=(["foreground"]="colour255")
wan_ip+=(["background"]="colour24")
wan_ip+=(["separator"]="${separator_left_bold}")
register_segment "wan_ip"

declare -A load
load+=(["script"]="${segments_path}/load.sh")
load+=(["foreground"]="colour167")
load+=(["background"]="colour237")
load+=(["separator"]="${separator_left_bold}")
register_segment "load"

declare -A date_day
date_day+=(["script"]="${segments_path}/date_day.sh")
date_day+=(["foreground"]="colour136")
date_day+=(["background"]="colour235")
date_day+=(["separator"]="${separator_left_bold}")
register_segment "date_day"

declare -A date_full
date_full+=(["script"]="${segments_path}/date_full.sh")
date_full+=(["foreground"]="colour136")
date_full+=(["background"]="colour235")
date_full+=(["separator"]="${separator_left_thin}")
date_full+=(["separator_fg"]="default")
register_segment "date_full"

# Print the status line in the order of registration above.
print_status_line_right

exit 0
