#!/bin/bash
set -e

gcc src/q3.c -o q3
output=$(echo "Alice" | ./q3)
if [[ "$output" == *"Alice"* ]]; then
  echo "✅ Q3 passed"
else
  echo "❌ Q3 failed"
  exit 1
fi

