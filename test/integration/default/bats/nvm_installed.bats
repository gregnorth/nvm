#!/usr/bin/env bats

setup() {
  source /etc/profile
}

@test "nvm is found in PATH" {
  run nvm help
  [ "$status" -eq 0 ]
}
