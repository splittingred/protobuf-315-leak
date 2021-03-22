#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'bootstrap'

class ResultsServer < Results::Service
  def get_result(_req, _call)
    GetResultResp.new
  end
end

port = ENV.fetch('GRPC_PORT', 8_200)

s = GRPC::RpcServer.new
s.add_http2_port("127.0.0.1:#{port}", :this_port_is_insecure)
s.handle(::ResultsServer.new)
s.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
