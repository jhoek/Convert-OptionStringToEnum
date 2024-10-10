<#
.EXAMPLE
pbpaste | Convert-OptionStringToEnum | pbcopy
#>
function Convert-OptionStringToEnum
{
    [CmdletBinding(DefaultParameterSetName = '__AllParameterSets')]
    [OutputType([string])]
    param
    (
        [Parameter(Mandatory, Position = 0)]
        [string]$OptionString,

        [Parameter(Mandatory, Position = 1, ParameterSetName = 'DevComment')]
        [string]$DevComment,

        [Parameter(ParameterSetName = 'DevComment')]
        [ValidateNotNull()]
        [scriptblock]$DevCommentFormat = { "nl-NL=$($_)" }
    )

    [string[]]$Options = ($OptionString -split ',')
    [string[]]$DevComments = ($DevComment -split ',') | ForEach-Object -Process $DevCommentFormat

    0..($Options.Length - 1) | Where-Object { $Options[$_] } | ForEach-Object {
        $Caption = ($Options[$_]).TrimStart('"').TrimEnd('"')

        if ($PSCmdlet.ParameterSetName -eq 'DevComment')
        {
            $Comment = ($DevComments[$_]).TrimStart('"').TrimEnd('"')
        }

        "    value($($_); $($Options[$_]))"
        '    {'

        switch ($PSCmdlet.ParameterSetName)
        {
            'DevComment'
            {
                "        Caption='$Caption'; Comment='$Comment'"
            }
            default
            {
                "        Caption='$Caption';"
            }
        }

        '    }'
    }
}