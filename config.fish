set TERM xterm-256color
set -U fish_greeting ""

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /root/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

function __conda_add_prompt; end
