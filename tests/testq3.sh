#!/bin/bash
set -e

gcc src/q3.c -o q3
output=$(./q3)

if [[ "$output" == *"hello"* || "$output" == *"Hello"* || "$output" == *"welcome"* || "$output" == *"Welcome"* ]]; then
  echo "✅ Q3 passed"
else
  echo "❌ Q3 failed"
  exit 1
fi

