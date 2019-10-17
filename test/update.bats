#!/usr/bin/env bats

load libs/bats-support/load
load libs/bats-assert/load
load test_helper

@test "jlenv-update with no plugins: updates jlenv with no missing plugin error." {
  run jlenv-update
  assert_success
  assert_output <<'STD_MSG'

  origin     https://github.com/jlenv/jlenv.git (fetch)
  origin     https://github.com/jlenv/jlenv.git (push)
  Updating jlenv

STD_MSG
}

# This will update jlenv because we have it installed as part of the test
# scaffolding.
# This will not update plugins because we don't have those setup.
# There is a gap here that could be covered by stub/mock of git.
# Right now the BATS tooling is not that mature - there are no stubs/mocks in
# bats-core.
@test "jlenv-update skips plugins that are not jlenv git repos." {
  mkdir -p "$JLENV_ROOT"/plugins/julia-plgna/bin
  mkdir -p "$JLENV_ROOT"/plugins/jlenv-plgnb/bin
  mkdir -p "$JLENV_ROOT"/plugins/jlenv-plgnc/bin
  
  run jlenv-update 
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
