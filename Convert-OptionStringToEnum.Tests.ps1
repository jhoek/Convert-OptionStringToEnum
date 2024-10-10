Describe 'Convert-OptionStringToEnum' {
    It 'Converts simple option strings' {
        Convert-OptionStringToEnum -OptionString 'Foo,Baz' | Should -Be @('    value(0; Foo)', '    {', '        Caption=''Foo'';', '    }', '    value(1; Baz)', '    {', '        Caption=''Baz'';', '    }')
    }

    It 'Converts option strings that contain empty values' {
        Convert-OptionStringToEnum -OptionString 'Foo,,Baz' | Should -Be @('    value(0; Foo)', '    {', '        Caption=''Foo'';', '    }', '    value(2; Baz)', '    {', '        Caption=''Baz'';', '    }')
    }

    It 'Converts option strings that contain values with spaces' {
        Convert-OptionStringToEnum -OptionString '"Foo Baz",Bar' | Should -Be @('    value(0; "Foo Baz")', '    {', '        Caption=''Foo Baz'';', '    }', '    value(1; Bar)', '    {', '        Caption=''Bar'';', '    }')
    }

    It 'Converts option captions' {
        Convert-OptionStringToEnum -OptionString 'Foo,Baz' -DevComment 'Bar,Qux' | Should -Be @('    value(0; Foo)', '    {', '        Caption=''Foo''; Comment=''nl-NL=Bar''', '    }', '    value(1; Baz)', '    {', '        Caption=''Baz''; Comment=''nl-NL=Qux''', '    }')
    }
}