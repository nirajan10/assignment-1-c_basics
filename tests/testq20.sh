#!/bin/bash
set -e

# Disallow loops or conditionals
if grep -E "for|while|if" src/q20.c; then
  echo "❌ Q20 failed (loops/conditionals not allowed)"
  exit 1
fi

# Disallow modulus operator
if grep -E "%" src/q20.c; then
  echo "❌ Q20 failed (modulus operator not allowed)"
  exit 1
fi

gcc src/q20.c -o q20

# Test: n=9 → multiple of 3 → should output 1
output=$(echo "9" | ./q20)
if echo "$output" | grep -q "1"; then
  echo "✅ Q20 test 1 passed"
else
  echo "❌ Q20 test 1 failed"
  exit 1
fi

# Test: n=10 → multiple of 5 → should output 1
output=$(echo "10" | ./q20)
if echo "$output" | grep -q "1"; then
  echo "✅ Q20 test 2 passed"
else
  echo "❌ Q20 test 2 failed"
  exit 1
fi

# Test: n=7 → not a multiple of 3 or 5 → should output 0
output=$(echo "7" | ./q20)
if echo "$output" | grep -q "0"; then
  echo "✅ Q20 test 3 passed"
else
  echo "❌ Q20 test 3 failed"
  exit 1
fi
