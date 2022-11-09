if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.config/fish/fish-alias.fish
source ~/.config/fish/functions/prompt.fish
source ~/.config/fish/functions/redefine_watson.fish
source ~/.config/fish/functions/tw-jira.fish
source ~/.config/fish/functions/aws_funcs.fish

set -xg valibrary ~/Projects/Development/validation-data-analysis
set -xg JIRA_API_TOKEN GjId8kVhmsamALd2Ijw5B834
set -xg EDITOR (which nvim)
set -xg EMAIL erik.samuelsson@northvolt.com
set -xg OneDrive "/Users/esamuelsson/Library/CloudStorage/OneDrive-northvolt.com/07_Customer Validation/"
set -xg GPG_TTY (tty)
set -xg DBT_PROFILES_DIR ~/Projects/Development/data-models
set -xg NVIM_PYTHON_LOG_FILE ~/.config/nvim/log




set -e fish_user_path 
set -x fish_user_path $HOME/.serverless//bin/
