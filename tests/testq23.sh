#!/bin/bash
set -e

# Disallow loops or conditionals
if grep -E "for|while|if" src/q23.c; then
  echo "❌ Q23 failed (loops/conditionals not allowed)"
  exit 1
fi

gcc src/q23.c -o q23

# Test: num=8 → power of 2 → should output 1
output=$(echo "8" | ./q23)
if echo "$output" | grep -q "1"; then
  echo "✅ Q23 test 1 passed"
else
  echo "❌ Q23 test 1 failed"
  exit 1
fi

# Test: num=12 → not a power of 2 → should output 0
output=$(echo "12" | ./q23)
if echo "$output" | grep -q "0"; then
  echo "✅ Q23 test 2 passed"
else
  echo "❌ Q23 test 2 failed"
  exit 1
fi

# Test: num=1 → power of 2 (2^0) → should output 1
output=$(echo "1" | ./q23)
if echo "$output" | grep -q "1"; then
  echo "✅ Q23 test 3 passed"
else
  echo "❌ Q23 test 3 failed"
  exit 1
fi

# Test: num=0 → not a power of 2 → should output 0
output=$(echo "0" | ./q23)
if echo "$output" | grep -q "0"; then
  echo "✅ Q23 test 4 passed"
else
  echo "❌ Q23 test 4 failed"
  exit 1
fi
