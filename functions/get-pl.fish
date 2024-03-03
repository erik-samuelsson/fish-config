function get-pl --wraps=aws\ s3\ cp\ s3://validation-data-external/\(pbpaste\ \|\ tr\ -d\ \'\\n\'\)\ - --description alias\ get-pl\ aws\ s3\ cp\ s3://validation-data-external/\(pbpaste\ \|\ tr\ -d\ \'\\n\'\)\ -
  aws s3 cp s3://validation-data-external/(pbpaste | tr -d '\n') - $argv
        
end
