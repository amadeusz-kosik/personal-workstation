# When searching for history entries in the line editor, do not display duplicates of a line previously found, even if the duplicates are not contiguous. 
setopt HIST_FIND_NO_DUPS

# If a new command line being added to the history list duplicates an older one, the older command is removed from the list (even if it is not the previous event). 
setopt HIST_IGNORE_ALL_DUPS

# Do not enter command lines into the history list if they are duplicates of the previous event. 
setopt HIST_IGNORE_DUPS

# Remove command lines from the history list when the first character on the line is a space, or when one of the expanded aliases contains a leading space. Only normal aliases (not global or suffix aliases) have this behaviour. Note that the command lingers in the internal history until the next command is entered before it vanishes, allowing you to briefly reuse or edit the line. If you want to make it vanish right away without entering another command, type a space and press return.
setopt HIST_IGNORE_SPACE

# When writing out the history file, older commands that duplicate newer ones are omitted.
setopt HIST_SAVE_NO_DUPS

# This option both imports new commands from the history file, and also causes your typed commands to be appended to the history file (the latter is like specifying INC_APPEND_HISTORY, which should be turned off if this option is in effect). The history lines are also output with timestamps ala EXTENDED_HISTORY (which makes it easier to find the spot where we left off reading the file after it gets re-written). 
setopt SHARE_HISTORY

# If set, parameter expansion, command substitution and arithmetic expansion are performed in prompts. Substitutions within prompts do not affect the command status. 
setopt prompt_subst

# Add coreults to PATH. 'coreutils' package from brew is required for dircolors to work.
PATH="$PATH:/opt/homebrew/opt/coreutils/libexec/gnubin"

# Dircolors
eval "$(dircolors -b $HOME/.dir_colors)"

autoload -Uz colors && colors

# VCS info for prompt
autoload -Uz vcs_info
precmd() { vcs_info }

# VSC info formatting. See documentation for details:  https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#vcs_005finfo-Configuration
zstyle ':vcs_info:*' 		check-for-changes 	true
zstyle ':vcs_info:*' 		unstagedstr 		'%F{red}[unstaged]%f'
zstyle ':vcs_info:*' 		stagedstr 			'%F{yellow}[staged]%f'
zstyle ':vcs_info:*' 		actionformats 		'%F{blue}%s:%f [%b] %c%u %a %m'
zstyle ':vcs_info:*' 		formats 			'%F{blue}%s:%f [%b] %c%u %m'

# Prompt
PS1='%/ ${vcs_info_msg_0_} '$'\n'"%n @ %m $ "



