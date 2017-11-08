#!/bin/sh
LD_PRELOAD=bin/libnumcpus.so  _NUM_CPUS=2 java -cp bin/classes demo.NumProcessors