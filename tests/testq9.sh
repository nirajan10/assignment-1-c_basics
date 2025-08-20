#!/bin/bash
set -e

gcc src/q9.c -o q9
output=$(echo "10" | ./q9)
if echo "$output" | grep -q "1 week" && echo "$output" | grep -q "3 days"; then
  echo "✅ Q9 passed"
else
  echo "❌ Q9 failed"
  exit 1
fi
