for f in *;
do
	if [[ "$f" =~ (.*)_[LATE_]*.*_.*_(.*) ]] 
	then
		dir=${BASH_REMATCH[1]}
		file=${BASH_REMATCH[2]}
		if [ -d $dir ]  
		then

			mv -- "$f" "$dir/$file"
			echo "Putting $f in $dir and renaming it to $file"
		else
			mkdir "$dir"
			echo "Creating directory: $dir"
			mv -- "$f" "$dir/$file"
			echo "Putting $f in $dir and renaming it to $file"
		fi
	else
		echo "Nothing done for $f"
	fi
done

