function redo_tag
  echo $argv 
  echo $argv 
  git tag -d $argv 
  git push --delete origin $agrv 
  git tag $argv 
  git push --tags
end
