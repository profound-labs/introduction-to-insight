#!/bin/sh
# check for typical typos in the body text

TEXTDIR="../src-tex/"

# find un-accented spelling of Pali
grep -iE -f pali_typos $TEXTDIR/*.tex

# find - instead of -- 
grep -E '[^[:alpha:]-]-[^[:alpha:]-]' $TEXTDIR/*.tex
# %s/\([^[:alpha:]-]\)-\([^[:alpha:]-]\)/\1--\2/gc

# find ... instead of \ldots{}
grep -E '\.\.\.' $TEXTDIR/*.tex

# find un-smart double quotes
# find un-smart single quotes
grep -E " '{1,2}\w" $TEXTDIR/*.tex
grep -E ' "{1,2}\w' $TEXTDIR/*.tex
# %s/ '\{1,2\}\(\w\)/ `\1/gc
# sed -i 's/ '"'"'\(\w\)/ `\1/g' $TEXTDIR/*.tex

# find wrong quote and puncuation placement
grep -E '['"'"'"]{1,2}[,;:.?!]' $TEXTDIR/*.tex
# sed -i 's/\(['"'"'"]\)\([,;:.?!]\)/\2\1/g' $TEXTDIR/*.tex

# will not match a footnote w/ {} inside
grep -E '\\footnote\{[^}]+\}[,;:.?!]' $TEXTDIR/*.tex

