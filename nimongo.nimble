# Package
description = "Pure Nim driver for MongoDB with support of synchronous and asynchronous I/O modes"
version     = "0.2"
license     = "MIT"
author      = "Rostyslav Dzinko <rostislav.dzinko@gmail.com>"

# Dependencies
requires "scram >= 0.1.7"

proc runTest(input: string) =
  let cmd = "nim c -r " & input
  echo "running: " & cmd
  exec cmd

proc testNoMongod() =
  runTest "nimongo/bson.nim"
  runTest "tests/bsontest.nim"

task test, "tests":
  testNoMongod()
  runTest "tests/nimongotest.nim"

task test_ci, "tests for CI":
  testNoMongod()
