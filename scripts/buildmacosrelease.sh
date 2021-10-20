#!/usr/bin/env bash
cd "$(dirname $0)"
error=47
base=".."
root="${base}/linux"
dr="release/macos/dynamic"
release="${base}/${dr}"
source="${root}/src"
lib="${source}/lib/macos"
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
  if make buildmacosobjects; then
    error=$((error + 1))
    if make buildmacosarchive; then
      error=$((error + 1))
      if make releasedynamicmacos; then
        error=$((error + 1))
        if mv "${dr}/strcase" "${release}/strcase.darwin"; then
          printf '%s\n' "All MAKE tasks completed successfully."
        else exit $error; fi
        cd "${root}"
      else exit $error; fi
    else exit $error; fi
  else exit $error; fi
else exit $error; fi
