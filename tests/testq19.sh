#!/bin/bash
set -e

# Disallow loops or conditionals
if grep -E "for|while|if" src/q19.c; then
  echo "❌ Q19 failed (loops/conditionals not allowed)"
  exit 1
fi

gcc src/q19.c -o q19

# Test: a=5, b=5, c=7 → a==b true, b!=c true → should output 1
output=$(echo -e "5\n5\n7" | ./q19)
if echo "$output" | grep -q "1"; then
  echo "✅ Q19 test 1 passed"
else
  echo "❌ Q19 test 1 failed"
  exit 1
fi

# Test: a=4, b=4, c=4 → a==b true, b!=c false → should output 0
output=$(echo -e "4\n4\n4" | ./q19)
if echo "$output" | grep -q "0"; then
  echo "✅ Q19 test 2 passed"
else
  echo "❌ Q19 test 2 failed"
  exit 1
fi
