#!/bin/bash

while inotifywait -r -e modify --exclude '~$' "$1"; do
  mvn compile
done

