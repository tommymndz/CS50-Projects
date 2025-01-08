from plates import is_valid

def test_plates():
    #without alphanumeric characters
    assert is_valid("PI3.14") == False
    assert is_valid("PI3 14") == False
    assert is_valid("PI3?14") == False
    assert is_valid("PI3!14") == False
    #without checks for number placementc
    assert is_valid("AAA22A") == False
    #without checks for zero placement
    assert is_valid("AAA022") == False
    #without beginning alphabetical checks
    assert is_valid("222222") == False
    #without lenght checks
    assert is_valid("A") == False
    assert is_valid("AAA222A") == False

