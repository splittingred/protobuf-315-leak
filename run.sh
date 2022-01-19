#!/usr/bin/env bash

set -o errexit
green='\033[0;32m'
info='\033[0;28m'
no_color='\033[0m'

ok() {
    echo -e "$green$1$no_color"
}
info() {
    echo -e "$info$1$no_color"
}

ok "On Ruby version: $(ruby -v)"
ok "------------------------------------"
ok "Running Protobuf 3.14 test"
info "------------------------------------"
export BUNDLE_GEMFILE=Gemfile
info "Installing gems..."
bundle update

info "Starting grpc server..."
ruby lib/server.rb &
server_1_pid=$!

info "Letting server boot..."
sleep 1

info "Beginning benchmark..."
info "10,000 Requests:"
ruby lib/benchmark.rb
info "20,000 Requests:"
CLIENT_CALLS=20000 ruby lib/benchmark.rb
info "40,000 Requests:"
CLIENT_CALLS=40000 ruby lib/benchmark.rb

info "------------------------------------"
ok "Running Protobuf 3.15.7 test"
info "------------------------------------"
export BUNDLE_GEMFILE=Gemfile.3_15_7
info "Installing gems..."
bundle update

info "Starting grpc server..."
ruby lib/server.rb &
server_1_pid=$!

info "Letting server boot..."
sleep 1

info "Beginning benchmark..."
info "10,000 Requests:"
ruby lib/benchmark.rb
info "20,000 Requests:"
CLIENT_CALLS=20000 ruby lib/benchmark.rb
info "40,000 Requests:"
CLIENT_CALLS=40000 ruby lib/benchmark.rb

info "------------------------------------"
ok "Running Protobuf 3.15.8 test"
info "------------------------------------"
export BUNDLE_GEMFILE=Gemfile.3_15_8
info "Installing gems..."
bundle update

info "Starting grpc server..."
ruby lib/server.rb &
server_1_pid=$!

info "Letting server boot..."
sleep 1

info "Beginning benchmark..."
info "10,000 Requests:"
ruby lib/benchmark.rb
info "20,000 Requests:"
CLIENT_CALLS=20000 ruby lib/benchmark.rb
info "40,000 Requests:"
CLIENT_CALLS=40000 ruby lib/benchmark.rb

info "------------------------------------"
ok "Running Protobuf 3.19.3 test"
info "------------------------------------"
export BUNDLE_GEMFILE=Gemfile.3_19_3
info "Installing gems..."
bundle update

info "Starting grpc server..."
ruby lib/server.rb &
server_1_pid=$!

info "Letting server boot..."
sleep 1

info "Beginning benchmark..."
info "10,000 Requests:"
ruby lib/benchmark.rb
info "20,000 Requests:"
CLIENT_CALLS=20000 ruby lib/benchmark.rb
info "40,000 Requests:"
CLIENT_CALLS=40000 ruby lib/benchmark.rb

ok "Benchmarks successful! Shutting down server..."
kill -9 $server_1_pid
ok "Server shutdown, benchmark finished successfully."
