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

function rlogin
  set AWS_PROFILE "nv-redshift-developer-datalake"
  set RS_CLUSTER eu-north-1-aws-datalake-data-platform-redshift
  set user developer
  set RS_USER "IAM%3A$user"  # %3A = : encoding
  set RS_HOST eu-north-1-aws-datalake-data-platform-redshift.czoml5r2boyw.eu-north-1.redshift.amazonaws.com
  set RS_PORT 5439
  set RS_DB datawarehouse

  set PGPASS_REDSHIFT (aws redshift get-cluster-credentials --duration-seconds=3600 --profile="$AWS_PROFILE" --cluster-identifier="$RS_CLUSTER" --db-user="$user" | jq -r '.DbPassword' | tr -d \")
  echo $PGPASS_REDSHIFT
  set PGPASS_ENCODED (echo -n $PGPASS_REDSHIFT | jq -sRr @uri)
  echo $PGPASS_ENCODED
  set DB_REDSHIFT_DATAWAREHOUSE "postgres://$RS_USER:$PGPASS_ENCODED@$RS_HOST:$RS_PORT/$RS_DB?sslmode=require"

  set -xg DBEE_CONNECTIONS '[
  {
    "name": "redshift-datawarehouse",
    "url": "'$DB_REDSHIFT_DATAWAREHOUSE'",
    "type": "redshift"
  }
]' 
  echo $DBEE_CONNECTIONS > $HOME/.local/share/db_ui/connections.json
end

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
