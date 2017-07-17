DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
for entry in "$search_dir"$DIR/*; do
	if [ $entry != $DIR"/script.sh" ]; then
		ln -s $entry $HOME/.$(basename $entry);
	fi
done
