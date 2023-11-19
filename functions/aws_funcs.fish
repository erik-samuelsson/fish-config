function aws_redshift_login
  set -xg AWS_PROFILE "nv-datalake"

  set -xg RS_CLUSTER eu-north-1-aws-datalake-data-platform-redshift
  set -xg PGPASSWORDRAW (aws --profile nv-datalake redshift get-cluster-credentials --cluster-identifier $RS_CLUSTER --db-user developer --duration-seconds 1800 | awk 'FNR==3 {print $2}' | tr -d \", )
  set -xg PGPASSWORD (echo $PGPASSWORDRAW | sed 's/%/%25/g' | sed 's/=/%3D/g' | sed 's/&/%26/g' | sed 's/@/%40/g' | sed 's/:/%3A/g' | sed 's/?/3F/g' | sed 's/\//%2F/g' | sed 's/\[/%5B/' | sed 's/\]/%5D/')
  set -xg RS_HOST eu-north-1-aws-datalake-data-platform-redshift.czoml5r2boyw.eu-north-1.redshift.amazonaws.com
  set -xg RS_USER "IAM%3Adeveloper"  # %3A = : encoding
  set -xg RS_PORT 5439
  set -xg RS_DB datawarehouse
  set -xg DB_REDSHIFT "postgres://$RS_USER:$PGPASSWORD@$RS_HOST:$RS_PORT/$RS_DB?sslmode=require"
  echo "[{\"url\": \"$DB_REDSHIFT\", \"name\": \"redshift\"}]" >"$HOME/.local/share/db_ui/connections.json"
end
#{\"url\": \"$DB_ANALYTICAL_RDS\", \"name\": \"rnd_rds\"}

function awsredcon
  set -xg RS_CLUSTER eu-north-1-aws-datalake-data-platform-redshift
  set -xg PGPASSWORDRAW (aws --profile nv-datalake redshift get-cluster-credentials --cluster-identifier $RS_CLUSTER --db-user developer --duration-seconds 1800 | awk 'FNR==3 {print $2}' | tr -d \", )
  set -xg PGPASSWORD (echo $PGPASSWORDRAW | sed 's/%/%25/g' | sed 's/=/%3D/g' | sed 's/&/%26/g' | sed 's/@/%40/g' | sed 's/:/%3A/g' | sed 's/?/3F/g' | sed 's/\//%2F/g' | sed 's/\[/%5B/' | sed 's/\]/%5D/')
  set -xg RS_HOST eu-north-1-aws-datalake-data-platform-redshift.czoml5r2boyw.eu-north-1.redshift.amazonaws.com
  set -xg RS_USER "IAM%3Adeveloper"  # %3A = : encoding
  set -xg RS_PORT 5439
  set -xg RS_DB datawarehouse
  set -xg DB_REDSHIFT "postgres://$RS_USER:$PGPASSWORD@$RS_HOST:$RS_PORT/$RS_DB?sslmode=require"
end
#{\"url\": \"$DB_ANALYTICAL_RDS\", \"name\": \"rnd_rds\"}




function awsso
  cat ~/.aws/config | awk '/\[profile/ {print $2 }' | tr -d "]" | fzf --bind "enter:execute(aws sso login --profile {})+accept" 
  eval $(aws2-wrap --export)
end
