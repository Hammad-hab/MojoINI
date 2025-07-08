from mojoini import INIParser
from testing import assert_equal, assert_true

fn test_read() raises:

    var parser = INIParser()

    var parsed = parser.read_file("./samples/sample1.ini")
    assert_true(parsed.getItem('name')['value'] == 'John Doe', "Expected Name of Sample1 to be John Doe")
    assert_true(parsed.getItem('msg')['value'] == "Hello World!", "Expected Message of Sample1 to be 'Hello World!'")



fn test_sections() raises:

    var parser = INIParser()

    var parsed = parser.read_file("./samples/sample2.ini")
    var section1 = parsed.getItem('section1')
    var special_number = parsed.getItem('special_number')
    assert_true(section1['type'] == 'INIField', 'Seciton1 should be a field!')
    assert_true(special_number['type'] == 'INIValue', 'special_number should be a value!')

    var pair1 = section1['field1']
    var pair2 = section1['field2']
    assert_true(pair1 == 'some key', 'pair1 should be a equal to "some key"!')
    assert_true(pair2 == 'a serious value!', 'pair1 should be a equal to "a serious value!"!')
    