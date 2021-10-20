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
Tree /F "$root"
Get-ChildItem -Recurse -Path "$released"
$error_++
Test-Path ".\Release\strcase.exe" -PathType Leaf || Exit $error_
$error_++
Move-Item -Path ".\Release\strcase.exe" -Destination "$released\strcase-x86.exe" -Force || Exit $error_
$error_++
MSBuild /property:Configuration=Release /property:Platform=x64 || Exit $error_
$error_++
Move-Item -Path ".\x64\Release\strcase.exe" -Destination "$released\strcase-x64.exe" -Force || Exit $error_
Tree /F "$root"
Tree /F "$base/release/windows"