#!/usr/bin/env bash
# Zadanie 5 cz.2 - skrypt SQL -> CSV; stempel czasu ms -> s (usuniecie 3 zer).
# Uzycie: ./sql2csv.sh [plik.sql] [plik.csv]
set -euo pipefail
IN="${1:-steps-2csv.sql}"
OUT="${2:-steps.csv}"
{
  echo 'dateTime;steps;synced'
  sed 's/\r$//' "$IN" \
    | sed -E 's/.*VALUES \(([0-9]+), ([0-9]+), ([0-9]+)\);/\1;\2;\3/' \
    | awk -F';' '{print substr($1,1,length($1)-3)";"$2";"$3}'
} > "$OUT"
echo "Zapisano $OUT (stempel czasu w sekundach)."