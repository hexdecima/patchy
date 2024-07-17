SRC=$1
OUT=$2

compile_file() {
	BASENAME=$(basename "$1")
	BASENAME=${BASENAME%.*}
	fennel -c "$1" >"$2/$BASENAME.lua" || (echo "ERROR: Failed to compile '$1'." && exit 1)
}

compile_dir() {
  # NOTE: do not try to use that ${1:-""} syntax here because
  # I don't think my sanity can handle that again. also love bash but fuck bash.
	for ENTRY in "$SRC/$1"/*; do
		BASENAME=$(basename "$ENTRY")

		if [[ -f $ENTRY ]]; then
			EXT=${ENTRY##*.}

			if [[ $EXT != "fnl" ]]; then
				echo "WARNING: Ignoring file '$BASENAME', as its extension isn't .fnl."
			else
				compile_file "$ENTRY" "$OUT/$1"
			fi
		elif [[ -d $ENTRY ]]; then
			mkdir -p "$OUT/$1/$BASENAME"
			compile_dir "$1/$BASENAME"
		fi
	done
}

if [[ ! -e $SRC ]]; then
	echo "ERROR: Source not found."
	exit 1
elif [[ -f $SRC ]]; then
	compile_file "$SRC" "$OUT"
elif [[ -d $SRC ]]; then
	compile_dir ""
else
	echo "ERROR: Source found but is neither a file nor a directory."
	exit 1
fi
