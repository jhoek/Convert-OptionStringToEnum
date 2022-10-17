<#
.EXAMPLE
pbpaste | Convert-OptionStringToEnum | pbcopy
#>
function Convert-OptionStringToEnum
{
    [OutputType([string])]
    param
    (
        [Parameter(Mandatory, ValueFromPipeline, Position=0)]
        [string[]]$OptionString
    )

    process
    {
        $OptionString.ForEach{
            $Options = ($_ -split ',')

            0..($Options.Length - 1) | Where-Object { $Options[$_] } | ForEach-Object {
                "    value($($_); $($Options[$_]))",
                '    {',
                "        Caption='$($Options[$_])';",
                '    }'
            }
        }
    }
}