#!/bin/bash
set -e

# Disallow loops or conditionals
if grep -E "for|while|if" src/q21.c; then
  echo "⚠️ Warning: Found 'if', 'for', or 'while' in the code."
  echo "These may appear in comments, strings, or identifiers — please double-check."
  echo "Remove comment and instance of 'if', 'for', or 'while' from the code."
  echo "❌ Q21 failed (loops/conditionals not allowed)"
  exit 1
fi

gcc src/q21.c -o q21

# Test: x=1, y=2, z=3 → cyclic swap → x=2, y=3, z=1
output=$(echo -e "1\n2\n3" | ./q21 | tr -d '\n')
if echo "$output" | grep -q "2.*3.*1"; then
  echo "✅ Q21 test passed"
else
  echo "❌ Q21 test failed"
  exit 1
fi
