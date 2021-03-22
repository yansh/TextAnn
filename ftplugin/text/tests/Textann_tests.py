import unittest
import Textann as sut


@unittest.skip("Don't forget to test!")
class TextannTests(unittest.TestCase):

    def test_example_fail(self):
        result = sut.Textann_example()
        self.assertEqual("Happy Hacking", result)
