#!/usr/bin/env python3

## run all tests in tests/ directory
## or with file given as arg (ex ./run-tests tests/01_decl_assign.py)

import sys
import os
import subprocess

def fail(piton_output, python_output):
    print("------------------")
    print("failed with output:\n" +  piton_output + "\n")
    print("expected:\n" + python_output + "\n")
    print("------------------")
    exit()

def fail_error():
    print("------------------")
    print("failed with error")
    print("------------------")
    exit()

tests = []
if len(sys.argv) > 1:
    tests = [sys.argv[1]]
else:
    for testfile in os.scandir("tests/"):
        if testfile.is_dir():
            continue
        filename = testfile.name
        if not filename.endswith(".py"):
            continue
        if filename == "lib.py":
            continue
        tests.append("tests/" + filename)

tests.sort()

for test in tests:
    print(test)
    with open(test) as f:
        content = f.read()
    content = "from tests.lib import *\n" + content
    with open("tmp.py", "w") as f:
        f.write(content)
    python_cmd = "python3 tmp.py"
    python_output = subprocess.check_output([python_cmd], shell=True)
    python_output = python_output.decode('utf-8').strip()

    try:
        compile_cmd = "racket -t ./piton.rkt " + test
        subprocess.check_output([compile_cmd], shell=True)
        run_cmd = "spim -file ./out.s"
        piton_output = subprocess.check_output([run_cmd], shell=True)
        piton_output = piton_output.decode('utf-8').strip()
        piton_output = "\n".join(piton_output.split("\n")[5:])

        if piton_output != python_output:
            fail(piton_output, python_output)
    except subprocess.CalledProcessError as e:
        fail_error()

print("all tests passed")
os.remove("tmp.py")
os.remove("out.s")
