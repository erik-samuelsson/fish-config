function nvdevtoken --wraps=gql\ raw\ -v\ 2\>\&1\|grep\ -oE\ \'Authorization:\[Bearer\ \[a-zA-Z0-9._-\]+\'\|sed\ \'s/Authorization:\\\[Bearer\ //\'\ \|\ tr\ -d\ \'\\n\'\ \|\ pbcopy --wraps=gql\ raw\ -v\ 2\>\&1\|grep\ -oE\ \'Authorization:\[Bearer\ \[a-zA-Z0-9._-\]+\'\|sed\ \'s/Authorization:\\\[Bearer\ //\'\ \|\ tr\ -d\ \'\\n\'\ \|\ xargs\ -I\ \{\}\ set\ -x\ TOKEN\ \{\} --wraps=gql\ raw\ -v\ 2\>\&1\|grep\ -oE\ \'Authorization:\[Bearer\ \[a-zA-Z0-9._-\]+\'\|sed\ \'s/Authorization:\\\[Bearer\ //\'\ \|\ tr\ -d\ \'\\n\'\ \|\ \ set\ -x\ TOKEN\  --wraps=gql\ raw\ -v\ 2\>\&1\|grep\ -oE\ \'Authorization:\[Bearer\ \[a-zA-Z0-9._-\]+\'\|sed\ \'s/Authorization:\\\[Bearer\ //\'\ \|\ tr\ -d\ \'\\n\'\ \|\ xargs\ -I\ \{\}\ \'set\ -x\ TOKEN\ \{\}\' --wraps=gql\ raw\ -v\ 2\>\&1\|grep\ -oE\ \'Authorization:\[Bearer\ \[a-zA-Z0-9._-\]+\'\|sed\ \'s/Authorization:\\\[Bearer\ //\'\ \|\ tr\ -d\ \'\\n\'\ \|\ xargs\ \ set\ -x\ TOKEN\  --wraps=gql\ raw\ -v\ 2\>\&1\|grep\ -oE\ \'Authorization:\[Bearer\ \[a-zA-Z0-9._-\]+\'\|sed\ \'s/Authorization:\\\[Bearer\ //\'\ \|\ tr\ -d\ \'\\n\' --description alias\ nvdevtoken\ gql\ raw\ -v\ 2\>\&1\|grep\ -oE\ \'Authorization:\[Bearer\ \[a-zA-Z0-9._-\]+\'\|sed\ \'s/Authorization:\\\[Bearer\ //\'\ \|\ tr\ -d\ \'\\n\'
  set NC_DOMAIN api.dev.northvolt.com
  gql raw -v 2>&1|grep -oE 'Authorization:[Bearer [a-zA-Z0-9._-]+'|sed 's/Authorization:\[Bearer //' | tr -d '\n' $argv
end
