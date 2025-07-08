fn is_line_comment(line: String) -> Bool:
    return line.startswith(";")

fn is_empty(line: String) -> Bool:
    return len(line.replace('\n', '').strip()) == 0

fn is_key_value_pair(line: String) -> Bool:
    var l = line.strip()
    if "=" in l:
        substr = (l.split('='))
        if len(substr) == 2 and len(substr[0].strip()) > 0 and len(substr[1].strip()) > 0:
            return True
    return False
            

fn is_section_def(line: String) -> Bool:
    return line.startswith("[") and line.endswith("]") and len(line) > 2

fn unpack_key_value(line: String) -> Tuple[String, String]:
    var l = line.split("=", 1)
    var k = l[0]
    var v = l[1]
    return (k, v)