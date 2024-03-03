function find_delete_markers -a bucket -a prefix -a from 

   set query  'DeleteMarkers[?IsLatest==`true`]|[?LastModified>=`'$from'`]'

   aws s3api list-object-versions  --bucket $bucket --prefix $prefix --query $query | jq --arg fd $from '.[] | .LastModified |= (.[:-6] + "Z" | fromdate)   '
   return 0

end


function save_delete_markers -a bucket -a prefix -a from -a filepath

   find_delete_markers $bucket $prefix $from | jq -r -c '{Key, VersionId}' > $filepath
   return 0

end

function delete_markers -a filepath

  for f in (cat $filepath); 
      aws s3api delete-object --bucket validation-data-external --key (echo $f | jq -r '.Key') --version-id (echo  $f | jq -r '.VersionId'); 
  end

end
