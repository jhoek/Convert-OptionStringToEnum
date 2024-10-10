Describe 'Convert-OptionStringToEnum' {
    It 'Converts simple option strings' {
        Convert-OptionStringToEnum -OptionString 'Foo,Baz' | Should -Be @('    value(0; Foo)', '    {', '        Caption=''Foo'';', '    }', '    value(1; Baz)', '    {', '        Caption=''Baz'';', '    }')
    }

    It 'Converts option strings that contain empty values' {
        Convert-OptionStringToEnum -OptionString 'Foo,,Baz' | Should -Be @('    value(0; Foo)', '    {', '        Caption=''Foo'';', '    }', '    value(2; Baz)', '    {', '        Caption=''Baz'';', '    }')
    }

    # It 'Converts option strings that contain values with spaces' {

    # }

    # It 'Converts option captions' {

    # }
}