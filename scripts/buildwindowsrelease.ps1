#!/usr/bin/env bash
$error_ = 38
$this_path = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
cd "$this_path"
$base = ".."
$root = "$base/windows"
$error_++
Test-Path "$root" -PathType Container || Exit $error_
cd "${root}"
$error_++
MSBuild /property:Configuration=Release /property:Platform=x86 || Exit $error_
$error_++
MSBuild /property:Configuration=Release /property:Platform=x64 || Exit $error_
Tree /F "$this_path"