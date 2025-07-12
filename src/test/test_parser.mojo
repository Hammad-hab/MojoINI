from mojoini import INIParser
from testing import assert_equal, assert_true

fn test_read() raises:

    var parser = INIParser()

    var parsed = parser.parse_contents('name="John Doe"\nmsg="Hello World!"')
    assert_true(parsed.getItem('name')['value'] == 'John Doe', "Expected Name of Sample1 to be John Doe")
    assert_true(parsed.getItem('msg')['value'] == "Hello World!", "Expected Message of Sample1 to be 'Hello World!'")


fn test_sections() raises:

    var parser = INIParser()
    var parsed = parser.parse_contents('special_number=0\n\n[section1]\nfield1="some key"\nfield2="a serious value!"\n')
    var section1 = parsed.getItem('section1')
    var special_number = parsed.getItem('special_number')
    assert_true(section1['type'] == 'INIField', 'Seciton1 should be a field!')
    assert_true(special_number['type'] == 'INIValue', 'special_number should be a value!')

    var pair1 = section1['field1']
    var pair2 = section1['field2']
    assert_true(pair1 == 'some key', 'pair1 should be a equal to "some key"!')
    assert_true(pair2 == 'a serious value!', 'pair1 should be a equal to "a serious value!"!')

fn test_comments() raises:

    var parser = INIParser()
    var didRunSuccessful = True
    print('Testing full-line comments')
    var source = """
    ; This is a comment
    ; This is also a comment
    msg="Hello World"
    """

    var source_inline_comments = """
    ; This is a comment
    ; This is also a comment
    msg="Hello World" ; this is an inline comment
    msg2="Hi" ; Yeah!!
    """
    try:
        parsed = parser.parse_contents(source)
        parsed2 = parser.parse_contents(source_inline_comments)
        message = parsed.getItem('msg')
        message_inline = parsed2.getItem('msg')
        message_inline_2 = parsed2.getItem('msg2')
        if message['value'] != 'Hello World' or message_inline['value'] != 'Hello World' or message_inline_2['value'] != 'Hi':
            raise Error("Parsed successfully, but didn't get it right")
        
    except:
        didRunSuccessful = False
        raise

    assert_true(didRunSuccessful, 'Failed to properly parse comments')

fn test_errors() raises:
    var parser = INIParser()
    var didErrorAtInvalid = False
    var source = """
    special4=22;this should not throw an error
    [x] 
    [e34]
    [3w] ; This is the bad section
    """
    try:
        _ = parser.parse_contents(source)
    except:
        didErrorAtInvalid = True
    
    assert_true(didErrorAtInvalid, 'Parser did not raise an error at invalid ini')

fn main() raises:
    test_read()
    test_sections()
    test_comments()
    test_errors()