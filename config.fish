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
source ~/.config/fish/functions/find_delete_markers.fish


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

set -xg FZF_DEFAULT_COMMAND "fd --type f --strip-cwd-prefix --hidden --follow --exclude .git --include .github --exclude node_modules --exclude '*.rst*' --exclude '*.html' --exclude '*.doctree' --exclude '*.xlsx'"

#set -xg FZF_DEFAULT_COMMAND rg --files -g '"!**.html|!**.rst*|!**.svg|!**.xlsx|!**.db"'

# set -xg OPENAI_API_KEY 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
set -xg OPENAI_API_KEY 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

# set -xg SPARK_HOME /usr/local


# Northvolt standard setup
set -x GOVERSION "go1.21.5"


set -xg GOPATH $HOME/go


function nvdev
  source ~/src/github.com/northvolt/tools/etc/nvrc.fish
  # source ~/src/github.com/northvolt/tools/etc/nvrc.sh
  bass source ~/src/github.com/northvolt/tools/bin/git-global-config.sh
  #bass source ~/src/github.com/northvolt/nv-aws-sso-configs/aws-cli-helper-commands
end

function reset_goproxypass
  aws sso login --profile=nv-automation-dev
  set GOPROXY_PASS (aws --region eu-west-1 --profile=nv-automation-dev ssm get-parameter --with-decryption --name GOPROXY_PASS | jq -r '.Parameter.Value')
  security add-generic-password -a $USER -s GOPROXY_PASS -w $GOPROXY_PASS
end
# Fix GPG issue for signing github commits

# set -xg GPXP Yeeh8IZ2V661zWrv2urdowCvwkjbPSpU

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
