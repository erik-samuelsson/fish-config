function pnl-airflow --wraps=aws\ mwaa\ get-environment\ --name\ eu-north-1-aws-datalake-airflow-pnl-airflow\ \|\ jq\ .Environment.WebserverUrl\ \|\ tr\ -d\ \'\"\' --description alias\ pnl-airflow\ aws\ mwaa\ get-environment\ --name\ eu-north-1-aws-datalake-airflow-pnl-airflow\ \|\ jq\ .Environment.WebserverUrl\ \|\ tr\ -d\ \'\"\'
  aws mwaa get-environment --name eu-north-1-aws-datalake-airflow-pnl-airflow | jq .Environment.WebserverUrl | tr -d '"' $argv
        
end
