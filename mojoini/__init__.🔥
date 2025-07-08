from sys.terminate import exit
from .lines import *

struct INIParser:

    fn __init__(out self):
        ...

    fn read_file(self, file: String) -> Dict[String, Value]:
        try:
            with open(file, 'r') as f:
                var content = f.read() 
                return self._parse(content) 
        except:
            print('Failed to read file. ABORT')
            exit()

        return Dict[String,  Value]()

    fn _parse(self, content: String) -> Dict[String, Value]:
        var strlines = content.split('\n')
        var ini: Dict[String, Value] = {}
        for line in strlines:
            if is_line_comment(line) or is_empty(line):
                continue

            var fline = line

            if ';' in line:
                var line_w_comments = line.split(";")
                fline = line_w_comments[0]

            if is_section_def(line):
                var section_name = line[1:-1]
                # TODO: Add Sections
                # ini[section_name] = Dict[String, String]()

            if is_key_value_pair(fline):
                key, value = unpack_key_value(fline)
                if '"' in value:
                    value = value.replace('"', '')
                var value_s = Value(key)

                ini[key] = value_s

        return ini