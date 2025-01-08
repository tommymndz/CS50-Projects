from bank import value

def test_bank():
    assert value("Hello") == 0
    assert value("coco") == 100
    assert value("Hcoco") == 20


