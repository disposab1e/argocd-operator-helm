#!/bin/sh

crc config set cpus 4
crc config set memory 13000

crc start

eval $(crc oc-env)

