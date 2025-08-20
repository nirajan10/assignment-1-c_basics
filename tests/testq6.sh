#!/bin/bash
set -e

gcc src/q6.c -o q6
output=$(echo -e "5\n4" | ./q6)
if echo "$output" | grep -q "20"; then
  echo "✅ Q6 passed"
else
  echo "❌ Q6 failed"
  exit 1
fi
