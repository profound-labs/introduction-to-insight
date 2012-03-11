#!/bin/bash

# tidy up quotes

# TODO: no need to change:
# word (see `Chapter 1') word

mkdir bak

for i in ../src-tex/*.tex
do
    cp --backup=numbered "$i" "./bak/"$(basename "$i")".bak"
	cat "$i" | sed -f tidy_quotes > "$i.tmp"
	mv "$i.tmp" "$i"
done

# find - instead of --

# grep -E ' - ' ./*.tex
# sed -i 's/ - / -- /g' ./*.tex
# grep -E '[^-]-[^-]' ./*.tex
