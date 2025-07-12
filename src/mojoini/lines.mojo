fn is_line_comment(line: String) -> Bool:
    return line.startswith(";")

fn is_empty(line: String) -> Bool:
    return len(line.replace('\n', '').strip()) == 0 or line.strip() == '\n'

fn is_key_value_pair(line: String) -> Bool:
    var l = line.strip()
    if "=" in l:
        substr = (l.split('='))
        if len(substr) == 2 and len(substr[0].strip()) > 0 and len(substr[1].strip()) > 0:
            return True
    return False


fn is_int(char: String) -> Bool:
    var ints: String = '0123456789'
    if char in ints.split(''):
        return True
    return False

fn has_invalid_char(line: String) -> Bool:
    var invalids: String = ".*@#+-=,<>?|±§`~;:"
    for char in line:
        if char in invalids:
            return True

    return False

fn is_value_string(line: String) -> Bool:
    return line.startswith('"') and line.endswith('"') or line.startswith("'") and line.endswith("'")

fn is_section_def(line: String) -> Bool:
    var c = line.startswith("[") and line.endswith("]") and len(line) > 2
    return c

fn unpack_key_value(line: String) -> Tuple[String, String]:
    var l = line.split("=", 1)
    var k = l[0].replace(' ', '')
    var v: String = String(l[1].strip()) # remove trailing whitespaces
    return (k, v) 