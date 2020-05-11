HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=magenta,fg=white,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'
HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS='i'

bindkey -M emacs "$key_info[Control]P" history-substring-search-up
bindkey -M emacs "$key_info[Control]N" history-substring-search-down

# Vi
bindkey -M vicmd "k" history-substring-search-up
bindkey -M vicmd "j" history-substring-search-down

# Emacs and Vi
for keymap in 'emacs' 'viins'; do
	bindkey -M "$keymap" "$key_info[Up]" history-substring-search-up
	bindkey -M "$keymap" "$key_info[Down]" history-substring-search-down
done
