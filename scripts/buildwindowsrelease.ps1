#!/usr/bin/env bash
$error_ = 38
$this_path = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$released = "$base\release\windows"
cd "$this_path"
$base = ".."
$root = "$base\windows"
$error_++
Test-Path "$root" -PathType Container || Exit $error_
if (-not (Test-Path "$released" -PathType Container))
{
  $error_++
  New-Item -Type Directory -Name "$released"  || Exit $error_
}
cd "${root}"
$error_++
MSBuild /property:Configuration=Release /property:Platform=x86 || Exit $error_
$error_++
Move-Item -Force -Path "Release\strcase.exe" "$released/strcase-x86.exe" || Exit $error_
$error_++
MSBuild /property:Configuration=Release /property:Platform=x64 || Exit $error_
$error_++
Move-Item -Force -Path "x64\Release\strcase.exe" "$released/strcase-x64.exe" || Exit $error_
Tree /F "$root"
Tree /F "$base/release/windows"