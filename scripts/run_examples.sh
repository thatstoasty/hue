#!/bin/bash
TEMP_DIR=~/tmp
mkdir $TEMP_DIR
mojo package hue -o $TEMP_DIR/hue.mojopkg

echo -e "Building binaries for all examples...\n"
mojo build examples/hello_world.mojo -o $TEMP_DIR/hello_world

echo -e "Executing examples...\n"
cd tmp
./hello_world

cd ..
rm -R $TEMP_DIR
