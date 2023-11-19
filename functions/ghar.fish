function ghar --wraps='gh workflow run --ref (git rev-parse --abbrev-ref HEAD)' --description 'alias ghar gh workflow run --ref (git rev-parse --abbrev-ref HEAD)'
  gh workflow run --ref (git rev-parse --abbrev-ref HEAD) $argv
        
end
