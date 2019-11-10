<#
.Synopsis
   Configures regional settings.
.DESCRIPTION
   Configures regional settings based on an xml file that is used by intl.cpl
   A transcript file is saved to Windows\Invoke-ConfigureRegionalOptions.log
.PARAMETER  XMLFileName
    The name of the xml file that contains your regional settings. eg en-GB.xml
.EXAMPLE
   Invoke-ConfigureRegionalSettings -XMLFileName "en-GB.xml"   
.NOTES
    Based off a PowerShell script obtained from another website (sorry - I never made a note of where.)
    Refactored:
        - Simplified the original code.
        - Added parameter $XMLFileName to enable easier script re-use.
    Created: 15-Mar-2019
    Author: OH
    Website: https://fearthepanda.com
    Buy my book: Deploy anything using SCCM and PowerShell! https://leanpub.com/configmgr-DeployUsingPS       
#>

Param (
    $XMLFileName
)

$LogFileLocation = "$env:SystemRoot\Invoke-ConfigureRegionalOptions.log"

Start-Transcript -path $LogFileLocation -Force

[string]$ScriptDirectory = Get-Location

Write-Output "------------ Start Script  ------------"
Write-Output ""
Write-Output "------------------------------------"
Write-Output "Get language xml path"
Write-Output "------------------------------------"
Write-Output ""

$XMLPath = Join-Path -Path $ScriptDirectory -ChildPath $XMLFileName

Write-Output $XMLPath
Write-Output ""

Write-Output "------------------------------------"
Write-Output "Set language xml as active"
Write-Output "------------------------------------"
Write-Output ""
Write-Output "Execute $env:SystemRoot\System32\control.exe intl.cpl,,/f:`"$XMLPath`""

& $env:SystemRoot\System32\control.exe "intl.cpl,,/f:`"$XMLPath`""

Write-Output ""
Write-Output "Start Sleep for 2 seconds"
start-sleep -seconds 2

Write-Output ""
Write-Output "------------- End Script  -------------"

Stop-Transcript