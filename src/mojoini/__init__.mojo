from sys.terminate import exit
from .lines import *
from .SDict import SDict

alias SECTION_VAL = 'Section'
alias STR_VAL = 'Section'

alias Section = SDict
alias StringDict = Dict[String, String]

struct INIParser:

    fn __init__(out self):
        ...

    fn read_file(self, file: String) raises -> Section:
        with open(file, 'r') as f:
                var content = f.read() 
                return self._parse(content) 

    fn _parse(self, content: String) -> Section:
        var strlines = content.split('\n')
        var main: Section = {}
        var push_mode = 0
        var secondary: StringDict = StringDict()
        var section_push_name: String = 'Na'

        for line in strlines:
            if is_line_comment(line):
                continue

            if is_empty(line):
                if section_push_name != 'Na':
                    main.setItem(section_push_name, secondary)
                    push_mode = 0
                    section_push_name = 'Na'
                continue

            var fline = line

            if ';' in line:
                var line_w_comments = line.split(";")
                fline = line_w_comments[0]

            if is_section_def(line):
                if section_push_name != 'Na': # Push the old storage back in if a new section is found
                    main.setItem(section_push_name, secondary)
                    secondary.clear()

                var section_name = line[1:-1]
                push_mode = 1
                section_push_name = section_name

            if is_key_value_pair(fline):
                key, value = unpack_key_value(fline)
                if '"' in value:
                    value = value.replace('"', '')
                    
                if push_mode == 0: # Push to main
                    main.setItem(key, {
                        'value': value,
                        'type': 'INIValue'
                    })
                elif push_mode == 1:
                    secondary['type'] = 'INIField'
                    secondary[key] = value

        return main