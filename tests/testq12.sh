#!/bin/bash
set -e

# Disallow loops or conditionals
if grep -E "for|while|if" src/q12.c; then
  echo "⚠️ Warning: Found 'if', 'for', or 'while' in the code."
  echo "These may appear in comments, strings, or identifiers — please double-check."
  echo "Remove comment and instance of 'if', 'for', or 'while' from the code."
  echo "❌ q12 failed (loops/conditionals not allowed)"
  exit 1
fi

# Compile
gcc src/q12.c -o q12

# Test 1: a=5, b=3, c=2 → true (1)
output=$(echo -e "5\n3\n2" | ./q12)
if ! echo "$output" | grep -q "1"; then
  echo "❌ Q12 failed on input (5,3,2)"
  exit 1
fi

# Test 2: a=2, b=5, c=2 → false (0)
output=$(echo -e "2\n5\n2" | ./q12)
if ! echo "$output" | grep -q "0"; then
  echo "❌ Q12 failed on input (2,5,2)"
  exit 1
fi

# Test 3: a=5, b=3, c=0 → false (0)
output=$(echo -e "5\n3\n0" | ./q12)
if ! echo "$output" | grep -q "0"; then
  echo "❌ Q12 failed on input (5,3,0)"
  exit 1
fi
