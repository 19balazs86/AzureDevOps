﻿param(
  [string]
  [Parameter(Mandatory=$true)]
  $csprojFile
)

$version = $csprojXml.Project.PropertyGroup.Version

Write-Host "##vso[task.setvariable variable=version]$version"