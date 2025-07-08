# MojoINI

MojoINI is a simple, lightweight INI file parser written in [Mojo](https://www.modular.com/mojo). It allows you to read and process INI configuration files with support for sections and key-value pairs.

## Features
- Parse INI files with or without sections
- Handles comments and empty lines
- Simple API for reading configuration values
- Written in Mojo for performance and simplicity

## Project Structure
```
src/mojoini/           # Main package
  __init__.mojo        # INIParser and main logic
  lines.mojo           # INI parsing helpers
  SDict.mojo           # Simple dictionary wrapper

test/                  # Test suite
  test_parser.mojo     # Basic tests for the parser
  samples/             # Sample INI files for testing
    sample1.ini
    sample2.ini
```

## Usage
### Example INI Files
**Simple INI (sample1.ini):**
```ini
name="John Doe"
msg="Hello World!"
```

**INI with Section (sample2.ini):**
```ini
special_number=0

[section1]
field1="some key"
field2="a serious value!"
```

### Parsing an INI File in Mojo
```mojo
from mojoini import INIParser

var parser = INIParser()
var parsed = parser.read_file("./samples/sample1.ini")

print(parsed.getItem('name')['value'])  # Output: John Doe
print(parsed.getItem('msg')['value'])   # Output: Hello World!
```

### Parsing Sections
```mojo
var parser = INIParser()
var parsed = parser.read_file("./samples/sample2.ini")

var section1 = parsed.getItem('section1')
print(section1['field1'])  # Output: some key
print(section1['field2'])  # Output: a serious value!
```

## API Reference
### `INIParser`
- `INIParser()` — Create a new parser instance.
- `read_file(file: String) -> Section` — Parse an INI file and return a `Section` (dictionary-like object).

### `Section` (alias for `SDict`)
- `.getItem(key: String)` — Retrieve a section or value by key.
- `.setItem(key: String, value: Dict[String, String])` — Set a section or value.

### Parsing Rules
- Lines starting with `;` are treated as comments.
- Empty lines separate sections.
- Section headers are written as `[section_name]`.
- Key-value pairs are written as `key=value`.
- Values can be quoted (e.g., `key="value"`).

## Running Tests
To run the test suite:
```sh
mojo test/test_parser.mojo
```

## License
MIT License
