#!/usr/bin/env python3

import os
import subprocess
import sys
import unittest

script_dir = os.path.dirname(os.path.realpath(__file__))


def run_test(switch, name):
    subprocess.run(
        f"../extrakto.py {switch} --alt < assets/{name}.txt | cmp - ./assets/{name}_result{switch}.txt",
        shell=True,
        check=True,
        cwd=script_dir,
    )


class TestAssets(unittest.TestCase):
    def test_all(self):
        for test in ["text1", "text2", "path", "unicode", "quotes"]:
            run_test("-w", test)

        for test in ["text1", "path"]:
            run_test("-pu", test)

        for test in ["text1", "quotes"]:
            run_test("-a=quote", test)


if __name__ == "__main__":
    unittest.main()
