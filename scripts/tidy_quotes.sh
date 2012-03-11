#!/bin/bash

for i in ../src-tex/*.tex
do
	cp --backup=numbered "$i" "$i"
	cat "$i" | sed -f tidy_quotes > "$i.tmp"
	mv "$i.tmp" "$i"
done
