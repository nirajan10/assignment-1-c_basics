#!/bin/bash
set -e

gcc src/q8.c -o q8
output=$(echo "0" | ./q8)
if echo "$output" | grep -q "32"; then
  echo "✅ Q8 passed"
else
  echo "❌ Q8 failed"
  exit 1
fi
