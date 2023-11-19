function pganalytics 
  set -x PGPASSWORD (aws ssm get-parameter --name '/analytics-db-prod/ANALYTICS_DB_DATABASE_PASSWORD' --region=eu-west-1 | awk 'FNR==5 { print $2 }' | tr -d \",) && psql -h analytics-db-1-instance-1.cwo8f6fsznq2.eu-west-1.rds.amazonaws.com -U postgres analyticsdb
end


