#!/bin/bash
set -e

# Disallow loops or conditionals
if grep -E "for|while|if" src/q14.c; then
  echo "❌ Q14 failed (loops/conditionals not allowed)"
  exit 1
fi

# Compile
gcc src/q14.c -o q14

# Test case 1: x=5, y=10 → after swap: x=10, y=5
output=$(echo -e "5\n10" | ./q14 | tr -d '\n')
if echo "$output" | grep -q "10.*5"; then
  echo "✅ Q14 test 1 passed"
else
  echo "❌ Q14 test 1 failed"
  exit 1
fi

