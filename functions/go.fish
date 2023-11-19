function setup_go
  aws sso login --profile=nv-automation-dev
  set -xg GOPROXY_PASS (aws --profile=nv-automation-dev ssm get-parameter --with-decryption --name GOPROXY_PASS |  jq -r '.Parameter.Value')
end 
