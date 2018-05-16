#!/usr/bin/env python3

## run all tests in tests/errors/ directory

import sys
import os
import subprocess

PITON_PATH = "src/piton.rkt"
TESTS_PATH = "tests/errors/"

def fail_error(piton_output):
    print("------------------")
    print("Failed with unexpected error")
    print(piton_output)
    print("------------------")
    sys.exit(1)

def scan_tests():
    test_paths = []
    for file in os.scandir(TESTS_PATH):
        if file.is_dir():
            continue
        if not file.name.endswith(".py"):
            continue
        test_paths.append(TESTS_PATH + file.name)
    test_paths.sort()
    return test_paths

def run_test(test_path):
    compile_cmd = PITON_PATH + " " + test_path
    try:
        subprocess.check_output([compile_cmd], shell=True)
        run_cmd = "spim -file ./out.s"
        piton_output = subprocess.check_output([run_cmd], shell=True)
        piton_output = piton_output.decode('utf-8').strip()
        piton_output = "\n".join(piton_output.split("\n")[5:])
        fail_error(piton_output)
    except subprocess.CalledProcessError as e:
        print()

def cleanup():
    os.remove("out.s")

def main():
    test_paths = scan_tests()
    for test_path in test_paths:
        print("Testing " + test_path + "...")
        run_test(test_path)
    print("All tests passed")

main()
