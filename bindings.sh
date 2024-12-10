#!/bin/bash

bindings=""

# Iterate over all environment variables
while IFS='=' read -r name value; do
  # Skip Render's system variables or variables starting with underscores if needed
  if [[ "$name" != "RENDER*" ]] && [[ "$name" != "_"* ]]; then
    # Escape special characters in value
    value=$(printf '%q' "$value")

    # Append to bindings
    bindings+="--binding ${name}=${value} "
  fi
done < <(env)

# Remove trailing spaces from bindings
bindings=$(echo "$bindings" | sed 's/[[:space:]]*$//')

# Output the final bindings string
echo "$bindings"
