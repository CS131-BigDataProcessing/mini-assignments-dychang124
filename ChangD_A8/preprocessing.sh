#!/bin/bash
awk -F',' '{ gsub(/^[ \t]+|[ \t]+$/, "", $0); if (NF < 16) print "Line", NR ":", $0 }' AB*.csv
awk -F, '{
  for (i=1; i<=NF; i++) {
    if ($i == "") $i = "NA";
  }
  print $0;
}' OFS=, AB*.csv > replace.csv

awk '!v[$1]++' AB_NYC_2019.csv > unique.csv

awk -F',' 'NR > 1 {print $10}' unique.csv | sort -n > prices.txt

total=$(wc -l < prices.txt)

q1_pos=$(echo "$total * 0.25" | bc | awk '{print int($1)}')
q3_pos=$(echo "$total * 0.75" | bc | awk '{print int($1)}')

q1=$(sed -n "${q1_pos}p" prices.txt)
q3=$(sed -n "${q3_pos}p" prices.txt)

iqr=$(echo "$q3 - $q1" | bc)

# Upper bound for outliers: Q3 + 1.5 * IQR
upper_bound=$(echo "$q3 + 1.5 * $iqr" | bc)

awk -F',' -v upper="$upper_bound" 'NR == 1 || $10 <= upper {print $0}' unique.csv > cleaned.csv
