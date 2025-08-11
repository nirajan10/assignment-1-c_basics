#!/bin/bash
set -e

gcc src/q10.c -o q10
output=$(echo -e "5\n9" | ./q10)
if echo "$output" | grep -q "5" && echo "$output" | grep -q "9"; then
  echo "✅ Q10 passed"
else
  echo "❌ Q10 failed"
  exit 1
fi
