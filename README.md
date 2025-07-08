# MojoINI

MojoINI is a simple INI file parser written in [Mojo](https://www.modular.com/mojo). It provides basic functionality to read and process INI configuration files.

## Features
- Parse INI files with sections and key-value pairs
- Simple API for reading configuration values
- Written in Mojo for performance and simplicity

## Project Structure
```
mojoini/           # Main package
  __init__.mojo    # Package initializer
  lines.mojo       # INI parsing logic

tests/             # Test suite
  samples/         # Sample INI files for testing
    sample1.ini
  test_basic.mojo  # Basic tests for the parser
```

## Getting Started
1. **Install Mojo**: Follow the instructions at [Modular's Mojo](https://www.modular.com/mojo) to set up Mojo on your system.
2. **Clone this repository**:
   ```sh
   git clone <repo-url>
   cd MojoINI
   ```
3. **Run tests**:
   ```sh
   mojo tests/test_basic.mojo
   ```

## Usage
Import and use the `mojoini` package in your Mojo projects to parse INI files.

## License
MIT License 