#!/usr/bin/bash

inotifywait -e modify -m . ./exercises |
  while read -r directory events filename; do
    printf "%s: %s: [%s]\n" "$directory" "$filename" "$events"
    if [[ "$filename" =~ ".zig" ]]; then
      zig build
    fi
  done
