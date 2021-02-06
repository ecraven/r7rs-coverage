#!/bin/bash
# make clean
export GUILE=guile3
export GERBIL_HOME=/opt/gerbil-scheme-git/
export GXI=/opt/gerbil-scheme-git/bin/gxi
export HUSKC=~/.cabal/bin/huskc
export HUSKI=~/.cabal/bin/huski
make -j8 $*

