from twttr import shorten

def test_twttr():
    assert shorten("HELLO") == "HLL"
    assert shorten("World") == "Wrld"
    assert shorten("1234") == "1234"
    assert shorten(".") == "."
