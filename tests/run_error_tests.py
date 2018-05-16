#!/usr/bin/env python3

## run all tests in error-tests/ directory

import sys
import os
import subprocess

if os.path.basename(os.getcwd()) == "tests":
    piton_path = "../src/piton.rkt"
    tests_path = "errors/"
    lib_path = "features.lib"
else:
    piton_path = "src/piton.rkt"
    tests_path = "tests/errors/"

tests = []
for testfile in os.scandir(tests_path):
    if testfile.is_dir():
        continue
    filename = testfile.name
    if not filename.endswith(".py"):
        continue
    tests.append(tests_path + filename)

tests.sort()

for test in tests:
    print(test)
    try:
        compile_cmd = piton_path + " " + test
        subprocess.check_output([compile_cmd], shell=True)
        run_cmd = "spim -file ./out.s"
        piton_output = subprocess.check_output([run_cmd], shell=True)
        piton_output = piton_output.decode('utf-8').strip()
        piton_output = "\n".join(piton_output.split("\n")[5:])
        print(piton_output + "\n")
    except subprocess.CalledProcessError as e:
        print()
        continue;

os.remove("out.s")
