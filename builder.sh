#!/bin/bash
set -x
go build -buildmode=c-archive -o go_dist/libdynamic_lifetime_go.a ./main/kea_hook_dynamic_lifetime/main.go
cmake .
make
cp libdynamic_lifetime.so ./dist/
