
echo "loading data..."
cat ./raw/holidaycheck.* | cut -f2,3 | sort  > holidaycheck.tsv


echo "Lines with no rating:"
cat holidaycheck.tsv | grep "^null" | wc -l

cat holidaycheck.tsv | grep -v "^null" | grep -v "^4" > holidaycheck.clean.filtered.tsv 

echo "total lines:"
wc -l holidaycheck.clean.filtered.tsv 

rm holidaycheck.tsv

echo "negative samples"
cat holidaycheck.clean.filtered.tsv | grep "^1\|^2\|^3" | wc -l


echo "positive samples"
cat holidaycheck.clean.filtered.tsv | grep "^5\|^6" | wc -l

cat holidaycheck.clean.filtered.tsv | grep "^1\|^2\|^3" > holidaycheck.clean.filtered.balanced.tsv
