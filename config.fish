if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.config/fish/fish-alias.fish
source ~/.config/fish/functions/prompt.fish
source ~/.config/fish/functions/redefine_watson.fish
source ~/.config/fish/functions/tw-jira.fish

set -xg valibrary ~/Projects/Development/validation-data-analysis
set -xg JIRA_API_TOKEN GjId8kVhmsamALd2Ijw5B834
set -xg EDITOR (which nvim)
set -xg EMAIL erik.samuelsson@northvolt.com
set -xg OneDrive "/Users/esamuelsson/Library/CloudStorage/OneDrive-northvolt.com/07_Customer Validation/"
set -xg GPG_TTY (tty)
set -xg DBT_PROFILES_DIR ~/Projects/Development/data-models

nvm use v17
