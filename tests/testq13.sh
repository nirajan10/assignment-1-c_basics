#!/bin/bash
set -e

# Disallow loops or conditionals
if grep -E "for|while|if" src/q13.c; then
  echo "❌ q13 failed (loops/conditionals not allowed)"
  exit 1
fi

# Compile
gcc src/q13.c -o q13

# Test case 1: 12 (divisible by 2 and 3 → true)
output=$(echo "12" | ./q13)
if echo "$output" | grep -q "1"; then
  echo "✅ Q13 test 1 passed"
else
  echo "❌ Q13 test 1 failed"
  exit 1
fi

# Test case 2: 10 (divisible by 2 but not 3 → false)
output=$(echo "10" | ./q13)
if echo "$output" | grep -q "0"; then
  echo "✅ Q13 test 3 passed"
else
  echo "❌ Q13 test 3 failed"
  exit 1
fi

# Test case 3: 9 (divisible by 3 but not 2 → false)
output=$(echo "9" | ./q13)
if echo "$output" | grep -q "0"; then
  echo "✅ Q13 test 4 passed"
else
  echo "❌ Q13 test 4 failed"
  exit 1
fi

# Test case 4: 7 (not divisible by 2 or 3 → false)
output=$(echo "7" | ./q13)
if echo "$output" | grep -q "0"; then
  echo "✅ Q13 test 5 passed"
else
  echo "❌ Q13 test 5 failed"
  exit 1
fi
