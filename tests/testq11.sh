#!/bin/bash
set -e

# Check that no loops or conditionals are used
if grep -E "for|while|if" src/q11.c; then
  echo "⚠️ Warning: Found 'if', 'for', or 'while' in the code."
  echo "These may appear in comments, strings, or identifiers — please double-check."
  echo "Remove comment and instance of 'if', 'for', or 'while' from the code."
  echo "❌ Q11 failed (loops/conditionals not allowed)"
  exit 1
fi

# Compile
gcc src/q11.c -o q11

# Run with input
output=$(echo "5" | ./q11)

# Expected: (5+1)*3 - 10 = 8
if echo "$output" | grep -q "8"; then
  echo "✅ Q11 passed"
else
  echo "❌ Q11 failed"
  exit 1
fi
