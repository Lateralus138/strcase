#!/usr/bin/env bash
cd "$(dirname $0)"
error=27
error=$((error + 1))
sudo apt-get install g++-arm-linux-gnueabi || exit $error
base=".."
root="${base}/linux"
dr="release/android/static"
release="${base}/${dr}"
source="${root}/src"
lib="${source}/lib/android"
include="${source}/include"
error=$((error + 1))
if [[ ! -d "$release" ]]; then
  if ! mkdir -p "$release"; then
    exit $error
  fi
fi
error=$((error + 1))
[[ ! -d "$root" ]] && exit $error
error=$((error + 1))
[[ ! -d "$source" ]] && exit $error
error=$((error + 1))
[[ ! -f "${source}/main.cpp" ]] && exit $error
cd "${root}"
error=$((error + 1))
if make createlibdirs; then
  error=$((error + 1))
  if make buildandroidobjects; then
    error=$((error + 1))
    if make buildandroidarchive; then
      error=$((error + 1))
      if make releasestaticandroid; then
        if mv "${dr}/strcase" "${release}/strcase.android"; then
          printf '%s\n' "All MAKE tasks completed successfully."
        else exit $error; fi
        cd "${root}"
      else exit $error; fi
    else exit $error; fi
  else exit $error; fi
else exit $error; fi
