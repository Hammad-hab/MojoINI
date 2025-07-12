from mojoini import INIParser
import time
from testing import assert_true

fn test_perf() raises:
    var t0 = time.perf_counter()
    var p = INIParser()
    _ = p.read_file("sample/monster.ini")
    var t1 = time.perf_counter()
    var delta = t1 - t0
    assert_true(delta <= 1, "Parsing is taking tooo long!")

fn main() raises:
    test_perf()