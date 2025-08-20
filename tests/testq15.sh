#!/bin/bash
set -e

# Disallow loops or conditionals
if grep -E "for|while|if" src/q15.c; then
  echo "❌ Q15 failed (loops/conditionals not allowed)"
  exit 1
fi

# Compile
gcc src/q15.c -o q15

# Test: n=8 → positive and even → should output 1
output=$(echo "8" | ./q15)
if echo "$output" | grep -q "1"; then
  echo "✅ Q15 positive-even test passed"
else
  echo "❌ Q15 positive-even test failed"
  exit 1
fi

# Test: n=7 → positive but odd → should output 0
output=$(echo "7" | ./q15)
if echo "$output" | grep -q "0"; then
  echo "✅ Q15 positive-odd test passed"
else
  echo "❌ Q15 positive-odd test failed"
  exit 1
fi

# Test: n=-4 → negative even → should output 0
output=$(echo "-4" | ./q15)
if echo "$output" | grep -q "0"; then
  echo "✅ Q15 negative-even test passed"
else
  echo "❌ Q15 negative-even test failed"
  exit 1
fi
