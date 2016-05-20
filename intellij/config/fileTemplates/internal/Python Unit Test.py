import pytest


def test_something():
  assert func() is not None


def test_something_else():
  with pytest.raises(ValueError):
    badfunc()
