#!/bin/bash
set -e

# Disallow loops or conditionals
if grep -E "for|while|if" src/q22.c; then
  echo "❌ Q22 failed (loops/conditionals not allowed)"
  exit 1
fi

gcc src/q22.c -o q22 -lm  # link math library

# Test: a=9, b=7 → sqrt(16) = 4 → rounded = 4
output=$(echo -e "9\n7" | ./q22)
if echo "$output" | grep -q "4"; then
  echo "✅ Q22 test 1 passed"
else
  echo "❌ Q22 test 1 failed"
  exit 1
fi

# Test: a=2, b=2 → sqrt(4) = 2 → rounded = 2
output=$(echo -e "2\n2" | ./q22)
if echo "$output" | grep -q "2"; then
  echo "✅ Q22 test 2 passed"
else
  echo "❌ Q22 test 2 failed"
  exit 1
fi

# Test: a=5, b=5 → sqrt(10) ≈ 3.16 → rounded = 3
output=$(echo -e "5\n5" | ./q22)
if echo "$output" | grep -q "3"; then
  echo "✅ Q22 test 3 passed"
else
  echo "❌ Q22 test 3 failed"
  exit 1
fi
