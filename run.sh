#!/usr/bin/env bash

set -o errexit
green='\033[0;32m'
info='\033[0;30m'
no_color='\033[0m'

ok() {
    echo -e "$green$1$no_color"
}
info() {
    echo -e "$info$1$no_color"
}

ok "Running Protobuf 3.14 test"
export BUNDLE_GEMFILE=Gemfile
info "------------------"
info "Installing gems..."
bundle update

info "Starting grpc server..."
ruby lib/server.rb &
server_1_pid=$!

info "Letting server boot..."
sleep 1

info "Beginning benchmark..."
ruby lib/benchmark.rb

ok "Running Protobuf 3.15 test"
export BUNDLE_GEMFILE=Gemfile.3_15
info "------------------"
info "Installing gems..."
bundle update

info "Starting grpc server..."
ruby lib/server.rb &
server_1_pid=$!

info "Letting server boot..."
sleep 1

info "Beginning benchmark..."
ruby lib/benchmark.rb

ok "Benchmarks successful! Shutting down server..."
kill -9 $server_1_pid
ok "Server shutdown, benchmark finished successfully."
