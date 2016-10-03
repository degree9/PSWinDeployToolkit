<#
****************************************************************************************************
****************************************************************************************************
*********************************[                                  ]*******************************
*********************************[  PS Windows Deployment Toolkit   ]*******************************
*********************************[                                  ]*******************************
*********************************[    by Degree9 Solutions Inc.     ]*******************************
*********************************[                                  ]*******************************
*********************************[  http://degree9.mit-license.org  ]*******************************
*********************************[                                  ]*******************************
****************************************************************************************************
****************************************************************************************************    
#>

Import-Module -Name PowerShellLogging
Import-Module -Name PoshRSJob
Import-Module -Name MetroShell

Get-ChildItem ("$PSScriptRoot\Common\") | Where `
   { $_.Name -notlike '__*' -and $_.Name -like '*.ps1'} | ForEach `
   { . $_.FullName }

#Get-ChildItem ("$PSScriptRoot\Communications\") | Where `
#   { $_.Name -notlike '__*' -and $_.Name -like '*.ps1'} | ForEach `
#   { . $_.FullName }

#Get-ChildItem ("$PSScriptRoot\Data\") | Where `
#   { $_.Name -notlike '__*' -and $_.Name -like '*.ps1'} | ForEach `
#   { . $_.FullName }

#Get-ChildItem ("$PSScriptRoot\Diagnostic\") | Where `
#   { $_.Name -notlike '__*' -and $_.Name -like '*.ps1'} | ForEach `
#   { . $_.FullName }

Get-ChildItem ("$PSScriptRoot\Lifecycle\") | Where `
   { $_.Name -notlike '__*' -and $_.Name -like '*.ps1'} | ForEach `
   { . $_.FullName }