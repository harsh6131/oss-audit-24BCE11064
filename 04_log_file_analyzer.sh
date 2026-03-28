#!/bin/bash
# Script 4: Log File Analyzer
# Usage: ./04_log_file_analyzer.sh /var/log/messages error

LOGFILE=$1
KEYWORD=${2:-error}
COUNT=0
RETRY_LIMIT=3
ATTEMPT=1

if [ -z "$LOGFILE" ]; then
  echo "Usage: $0 /path/to/logfile [keyword]"
  exit 1
fi

if [ ! -f "$LOGFILE" ]; then
  echo "Error: File $LOGFILE not found."
  exit 1
fi

# Simulate a do-while style retry: check once, then retry while the file is empty.
until [ -s "$LOGFILE" ] || [ "$ATTEMPT" -gt "$RETRY_LIMIT" ]; do
  echo "Log file is empty. Retry $ATTEMPT of $RETRY_LIMIT..."
  sleep 2
  ATTEMPT=$((ATTEMPT + 1))
done

if [ ! -s "$LOGFILE" ]; then
  echo "Error: File $LOGFILE is still empty after retries."
  exit 1
fi

while IFS= read -r LINE; do
  if echo "$LINE" | grep -iq "$KEYWORD"; then
    COUNT=$((COUNT + 1))
  fi
done < "$LOGFILE"

echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"
echo ""
echo "Last 5 matching lines:"
grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
