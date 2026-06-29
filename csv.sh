set -euo pipefail
IN="${1:-steps-2sql.csv}"
OUT="${2:-steps.sql}"
sed 's/\r$//' "$IN" \
  | awk -F';' 'NR>1{printf "INSERT INTO stepsData (time, intensity, steps) VALUES (%s, %s, %s);\n",$1,$2,$3}' \
  > "$OUT"
echo "Zapisano $OUT ($(wc -l < "$OUT") instrukcji)."

