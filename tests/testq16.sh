#!/bin/bash
set -e

# Disallow loops or conditionals
if grep -E "for|while|if" src/q16.c; then
  echo "❌ Q16 failed (loops/conditionals not allowed)"
  exit 1
fi

gcc src/q16.c -o q16

# Test: x=4, y=6 → average = 5
output=$(echo -e "4\n6" | ./q16)
if echo "$output" | grep -q "5"; then
  echo "✅ Q16 test passed"
else
  echo "❌ Q16 test failed"
  exit 1
fi
