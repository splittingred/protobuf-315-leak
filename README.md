
## Google Protobuf 3.15 Memory Leak

This repository illustrates a memory leak in the google-protobuf 3.15 gem when used in gRPC.

## How to Run

Run: `./run.sh`

This will export a memory benchmark using https://github.com/michaelherold/benchmark-memory, illustrating that
google protobuf does not release allocated objects for GC appropriately. 
