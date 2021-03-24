#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'bootstrap'
require 'benchmark'
require 'benchmark/memory'

n = ENV.fetch('CLIENT_CALLS', 10_000).to_i

port = ENV.fetch('GRPC_PORT', 8_200)
client = Results::Stub.new("127.0.0.1:#{port}", :this_channel_is_insecure)

Benchmark.memory do |benchmark|
  benchmark.report('client') do
    n.times do
      begin
        client.get_result(GetResultReq.new)
      rescue StandardError, GRPC::Core::CallError => _e
        # noop
      end
    end
  end
end

