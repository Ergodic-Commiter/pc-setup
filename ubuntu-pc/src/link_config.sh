
function linkify-folder() {
  this_dir=$(realpath $1)
  that_dir=$(realpath $2)
  for file in $(find $this_dir -type f); do 
    rel_file=$(realpath --relative-to=$this_dir $file)
    new_file="${that_dir}/${rel_file}"
    if [[ -e $new_file ]]; then 
      rm $new_file
    fi 
    ln -s $file $new_file
  done
}

