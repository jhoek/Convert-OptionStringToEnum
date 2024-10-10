<#
.EXAMPLE
pbpaste | Convert-OptionStringToEnum | pbcopy
#>
function Convert-OptionStringToEnum
{
    [OutputType([string])]
    param
    (
        [Parameter(Mandatory, Position = 0)]
        [string]$OptionString,

        [Parameter(Position = 1, ParameterSetName = 'DevComment')]
        [string]$DevComment,

        [Parameter(ParameterSetName = 'DevComment')]
        [ValidateNotNull()]
        [string]$DevCommentFormat = { $_ }
    )

    $Options = ($OptionString -split ',')
    $DevComments = ($DevComment -split ',') | ForEach-Object -Process $DevCommentFormat

    0..($Options.Length - 1) | Where-Object { $Options[$_] } | ForEach-Object {
        "    value($($_); $($Options[$_]))",
        '    {',
        "        Caption='$($Options[$_] -replace '^"', '' -replace '"$','')';",
        '    }'
    }
}