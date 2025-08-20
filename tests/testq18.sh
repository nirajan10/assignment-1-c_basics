#!/bin/bash
set -e

# Disallow loops or conditionals
if grep -E "for|while|if" src/q18.c; then
  echo "❌ Q18 failed (loops/conditionals not allowed)"
  exit 1
fi

gcc src/q18.c -o q18

# Test: a=2, b=3, c=4 → 2² + 3² + 4² = 4 + 9 + 16 = 29
output=$(echo -e "2\n3\n4" | ./q18)
if echo "$output" | grep -q "29"; then
  echo "✅ Q18 test passed"
else
  echo "❌ Q18 test failed"
  exit 1
fi
