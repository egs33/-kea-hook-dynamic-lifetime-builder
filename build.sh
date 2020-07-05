#!/bin/bash
docker build . -t egs33/kea-hook-dynamic-lifetime-builder
docker run --rm -t -v `pwd`/dist:/kea-hook-dynamic-lifetime-master/dist egs33/kea-hook-dynamic-lifetime-builder
