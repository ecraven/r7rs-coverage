#!/bin/bash
make clean
export GUILE=guile3
export GERBIL_HOME=/opt/gerbil-scheme-git/
GXI=/opt/gerbil-scheme-git/bin/gxi make -j8
