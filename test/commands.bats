#!/usr/bin/env bats

load test_semver
load libs/bats-support/load
load libs/bats-assert/load
load test_helper

@test "update is listed in jlenv commands" {
  run jlenv-commands
  assert_success
  assert_line 'update'
}

@test "commands --sh should list update" {
  run jlenv-commands --sh
  assert_success
  assert_line 'update'
}

@test "commands --no-sh should list update" {
  run jlenv-commands --no-sh
  assert_success
  assert_line 'update'
}
