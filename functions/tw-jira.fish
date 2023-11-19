
function get_new_jira
    jira issue list -a (jira me) --plain | grep -v (get_tw_active_jira) | awk '{print $2}'
end

function get_tw_active_jira
    t jira | awk '/DADVG.+/' | sed 'N;s/\n/\\|/g'
end

function tj
    jira open (task _get $argv.jira_id)
end
