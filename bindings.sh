#!/bin/bash

bindings=""

# Iterate over all environment variables
while IFS='=' read -r name value; do
  # Exclude any variables that you don't want, such as Render's internal variables
  if [[ ! "$name" =~ ^RENDER_|^PATH$|^HOME$|^PWD$|^SHLVL$|^_ ]] && [[ -n "$value" ]]; then
    bindings+="--binding ${name}=${value} "
  fi
done < <(env)

# Trim trailing spaces
bindings=$(echo $bindings | sed 's/[[:space:]]*$//')

# Print the bindings
echo $bindings
