if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.config/fish/fish-alias.fish
source ~/.config/fish/functions/prompt.fish
source ~/.config/fish/functions/redefine_watson.fish
source ~/.config/fish/functions/tw-jira.fish
source ~/.config/fish/functions/aws_funcs.fish
source ~/.config/fish/functions/analytics.fish
source ~/.config/fish/functions/go.fish
source ~/.config/fish/functions/pyspark.fish
source ~/.config/fish/functions/popuptmux.fish


set -xg valibrary ~/Projects/Development/validation-data-analysis
set -xg JIRA_API_TOKEN GjId8kVhmsamALd2Ijw5B834
set -xg EDITOR (which nvim)
set -xg EMAIL erik.samuelsson@northvolt.com
set -xg OneDrive "/Users/esamuelsson/Library/CloudStorage/OneDrive-northvolt.com/07_Customer Validation/"
#set -xg DBT_PROFILES_DIR ~/Projects/Development/data-models
set -xg NVIM_PYTHON_LOG_FILE ~/.config/nvim/log


set -xg AIRFLOW_HOME ~/Projects/Development/AWSLambdas/airflow/

set -xg JAVA_HOME /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/

set -e fish_user_path 
set -x fish_user_path $HOME/.serverless//bin/
fish_add_path $HOME/.local/bin/ 
set -xg OBSIDIAN $HOME/Documents/NV/

set -xg FZF_DEFAULT_COMMAND "fd --type f --strip-cwd-prefix --hidden --follow --exclude .git --exclude node_modules --exclude '*.rst*' --exclude '*.html' --exclude '*.doctree' --exclude '*.xlsx'"

#set -xg FZF_DEFAULT_COMMAND rg --files -g '"!**.html|!**.rst*|!**.svg|!**.xlsx|!**.db"'

set -xg OPENAI_API_KEY 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

# set -xg SPARK_HOME /usr/local


# Northvolt standard setup
set -x GOVERSION "go1.21.1"


function nvdev
  source ~/src/github.com/northvolt/tools/etc/nvrc.fish
  source ~/src/github.com/northvolt/tools/etc/nvrc.sh
  bass source ~/src/github.com/northvolt/tools/bin/git-global-config.sh
  #bass source ~/src/github.com/northvolt/nv-aws-sso-configs/aws-cli-helper-commands
end

# Fix GPG issue for signing github commits

function awsdev
  set -xg AWS_PROFILE nv-automation-dev
  aws sso login --profile nv-automation-dev
end

fish_add_path --path $HOME/.local/bin 
fish_add_path --path $HOME/.cargo/bin 

# eval (gpg-agent --daemon)
set -xg GPG_TTY (tty)

# if test -f $HOME/.gpg-agent-info
#   bass $HOME/.gpg-agent-info
#   set -x GPG_AGENT_INFO
#   set -x SSH_AUTH_SOCK
# end
