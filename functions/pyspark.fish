function auth
  aws sso login --profile nv-datalake
  eval (aws2-wrap --export)
end 
