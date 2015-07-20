#!/usr/bin/env bats

setup() {
  source /etc/profile
}

@test "nvm is found in PATH" {
  run nvm help
  [ "$status" -eq 0 ]
}

@test "nodejs is found in PATH" {
  run which node
  [ "$status" -eq 0 ]
}

@test "node is found in system path" {
  # testing for /bin/node or /usr/bin/node
  result=$(which node | grep /bin/node | wc -l)
  [ "$result" -eq 1 ]
}

@test "nvm has system nodejs version installed" {
  result=$(nvm current | grep system | wc -l)
  [ "$result" -eq 1 ]
}
