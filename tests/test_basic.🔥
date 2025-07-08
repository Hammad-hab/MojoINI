from testing import assert_equal, assert_true
from mojoini import INIParser

fn test_read() raises:

    var parser = INIParser()

    var parsed = parser.read_file("./tests/samples/sample1.ini")
    assert_true(parsed['name'] == 'John Doe', "Expected Name of Sample1 to be John Doe")
    assert_true(parsed['msg'] == "Hello World!", "Expected Message of Sample1 to be 'Hello World!'")