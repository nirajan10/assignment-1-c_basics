#!/bin/bash
set -e

# Disallow loops or conditionals
if grep -E "for|while|if" src/q17.c; then
  echo "❌ Q17 failed (loops/conditionals not allowed)"
  exit 1
fi

gcc src/q17.c -o q17

# Test: 'A' → uppercase → should output 1
output=$(echo "A" | ./q17)
if echo "$output" | grep -q "1"; then
  echo "✅ Q17 uppercase test passed"
else
  echo "❌ Q17 uppercase test failed"
  exit 1
fi

# Test: 'a' → lowercase → should output 0
output=$(echo "a" | ./q17)
if echo "$output" | grep -q "0"; then
  echo "✅ Q17 lowercase test passed"
else
  echo "❌ Q17 lowercase test failed"
  exit 1
fi

# Test: '9' → digit → should output 0
output=$(echo "9" | ./q17)
if echo "$output" | grep -q "0"; then
  echo "✅ Q17 digit test passed"
else
  echo "❌ Q17 digit test failed"
  exit 1
fi
