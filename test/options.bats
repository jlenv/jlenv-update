#!/usr/bin/env bats

load test_semver
load libs/bats-support/load
load libs/bats-assert/load
# load libs/bats-mock/stub
load test_helper

# Mock git to return the appropriate remote
# We would do this because we are running with test jlenv and not the 
# installed jlenv whcich would have all shims etc setup.
# https://stackoverflow.com/a/52546483/152860

@test "jlenv-update --quiet" {
  run jlenv-update --quiet
  assert_success
  assert_output ''
}

# Currently these options are broken - fix when refactoring scripts.

@test "jlenv-update --noop" {
  run jlenv-update --noop
  assert_success
  assert_output <<'STD_MSG'

  origin     https://github.com/jlenv/jlenv.git (fetch)
  origin     https://github.com/jlenv/jlenv.git (push)
  Updating jlenv
  Skipping jlenv-plgnb; not an jlenv git repo
  Skipping jlenv-plgnc; not an jlenv git repo
  Skipping julia-plgna; not an jlenv git repo
STD_MSG
}

@test "jlenv-update --verbose skips plugins that are not jlenv git repos." {
  mkdir -p "$JLENV_ROOT"/plugins/julia-plgna/bin
  mkdir -p "$JLENV_ROOT"/plugins/jlenv-plgnb/bin
  mkdir -p "$JLENV_ROOT"/plugins/jlenv-plgnc/bin
  
  run jlenv-update --verbose
  assert_success
  assert_output <<'STD_MSG'

  origin     https://github.com/jlenv/jlenv.git (fetch)
  origin     https://github.com/jlenv/jlenv.git (push)
  Updating jlenv
  Skipping jlenv-plgnb; not an jlenv git repo
  Skipping jlenv-plgnc; not an jlenv git repo
  Skipping julia-plgna; not an jlenv git repo
STD_MSG

}

@test "update --quiet --noop" {
  run jlenv-update --quiet --noop
  assert_success
  assert_output <<'STD_MSG'

  origin     https://github.com/jlenv/jlenv.git (fetch)
  origin     https://github.com/jlenv/jlenv.git (push)
  Updating jlenv
  Skipping jlenv-plgnb; not an jlenv git repo
  Skipping jlenv-plgnc; not an jlenv git repo
  Skipping julia-plgna; not an jlenv git repo
STD_MSG
}
