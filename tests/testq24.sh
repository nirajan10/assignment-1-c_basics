#!/bin/bash
set -e

# Disallow loops or conditionals
if grep -E "for|while|if" src/q24.c; then
  echo "❌ Q24 failed (loops/conditionals not allowed)"
  exit 1
fi

gcc src/q24.c -o q24 -lm  # link with math library

# Test: num=16 → perfect square → should output 1
output=$(echo "16" | ./q24)
if echo "$output" | grep -q "1"; then
  echo "✅ Q24 test 1 passed"
else
  echo "❌ Q24 test 1 failed"
  exit 1
fi

# Test: num=20 → not a perfect square → should output 0
output=$(echo "20" | ./q24)
if echo "$output" | grep -q "0"; then
  echo "✅ Q24 test 2 passed"
else
  echo "❌ Q24 test 2 failed"
  exit 1
fi

# Test: num=1 → perfect square (1^2) → should output 1
output=$(echo "1" | ./q24)
if echo "$output" | grep -q "1"; then
  echo "✅ Q24 test 3 passed"
else
  echo "❌ Q24 test 3 failed"
  exit 1
fi

# Test: num=0 → perfect square (0^2) → should output 1
output=$(echo "0" | ./q24)
if echo "$output" | grep -q "1"; then
  echo "✅ Q24 test 4 passed"
else
  echo "❌ Q24 test 4 failed"
  exit 1
fi
