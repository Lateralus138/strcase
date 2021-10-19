#!/usr/bin/env bash
cd "$(dirname $0)"
error=0
bld_lnx_rls='buildlinuxrelease.sh'
bld_dbn_rls='builddebianrelease.sh'
bld_and_rls='buildandroidrelease.sh'
error=$((error + 1))
if [[ ! -f "$bld_lnx_rls" ]]; then
  exit $error
fi
error=$((error + 1))
if [[ ! -f "$bld_dbn_rls" ]]; then
  exit $error
fi
error=$((error + 1))
if [[ ! -f "$bld_and_rls" ]]; then
  exit $error
fi
error=$((error + 1))
if ./${bld_lnx_rls}; then
  printf '%s\n' "Linux build successful."
  error=$((error + 1))
  if ./${bld_dbn_rls}; then
    printf '%s\n' "Debian build successful."
    error=$((error + 1))
    if ./${bld_and_rls}; then
      printf '%s\n' "Android build successful."
      printf '%s\n' "All builds successful."
  else exit $?; fi
else exit $?; fi
