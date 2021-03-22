# frozen_string_literal: true

require 'rubygems'
require 'bundler'
Bundler.setup
require 'grpc'

$LOAD_PATH.unshift(File.realpath(File.join(File.dirname(__dir__), 'lib')))
$LOAD_PATH.unshift(File.realpath(File.join(File.dirname(__dir__), 'lib/pb')))

require_relative 'pb/Results_services_pb'
