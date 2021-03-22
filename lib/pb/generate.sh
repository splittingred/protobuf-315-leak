#!/bin/bash

set -e

grpc_tools_ruby_protoc --ruby_out=./ --grpc_out=./ ./Results.proto
