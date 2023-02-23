Import-Module (Join-Path -Path $PSScriptRoot -ChildPath Convert-OptionStringToEnum.psd1) -Force

Convert-HelpToMarkDown `
    -Title Convert-OptionStringToEnum `
    -Commands (Get-Command -Module Convert-OptionStringToEnum) `
    -Description 'PowerShell micro-module for converting BC option strings to enum values' |
    Out-File -FilePath (Join-Path $PSScriptRoot README.md) -Encoding utf8