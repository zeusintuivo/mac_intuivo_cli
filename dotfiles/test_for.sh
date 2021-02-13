#!/usr/bin/env bash

for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
   echo "${file}"
    ls -la "$file"
done;
