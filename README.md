
## Google Protobuf 3.15 Memory Leak

This repository illustrates a memory leak in the google-protobuf 3.15 gem when used in gRPC.

## How to Run

Run: `./run.sh`

This will export a memory benchmark using https://github.com/michaelherold/benchmark-memory, illustrating that
google protobuf does not release allocated objects for GC appropriately. 

## Sample Output

```
Running Protobuf 3.14 test
------------------
Installing gems...
Fetching gem metadata from https://rubygems.org/.........
Resolving dependencies...
Using memory_profiler 0.9.14
Using benchmark-memory 0.1.2
Using bundler 1.17.3
Using google-protobuf 3.14.0 (universal-darwin)
Using googleapis-common-protos-types 1.0.6
Using grpc 1.36.0 (universal-darwin)
Bundle updated!
Starting grpc server...
Letting server boot...
Beginning benchmark...
Calculating -------------------------------------
              client     3.976M memsize (     0.000  retained)
                        30.000k objects (     0.000  retained)
                         4.000  strings (     0.000  retained)
Calculating -------------------------------------
              client     3.976M memsize (     0.000  retained)
                        30.000k objects (     0.000  retained)
                         4.000  strings (     0.000  retained)
Running Protobuf 3.15 test
------------------
Installing gems...
Fetching gem metadata from https://rubygems.org/.........
Resolving dependencies...
Using memory_profiler 0.9.14
Using benchmark-memory 0.1.2
Using bundler 1.17.3
Using google-protobuf 3.15.6 (universal-darwin)
Using googleapis-common-protos-types 1.0.6
Using grpc 1.36.0 (universal-darwin)
Bundle updated!
Starting grpc server...
Letting server boot...
Beginning benchmark...
Calculating -------------------------------------
              client     4.616M memsize (   160.040k retained)
                        46.001k objects (     4.001k retained)
                         6.000  strings (     0.000  retained)
Calculating -------------------------------------
              client     4.600M memsize (   153.720k retained)
                        45.606k objects (     3.843k retained)
                         6.000  strings (     0.000  retained)
Benchmarks successful! Shutting down server...
Server shutdown, benchmark finished successfully.
```
