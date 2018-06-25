#!/bin/bash


optimizationOption=$1


echo -e "Patching 'coll-Heaps.cabal.template' into 'coll-Heaps.cabal'"

sed "s/\(\s*ghc-options:\s*\)-O0/\1-$optimizationOption/" ./coll-Heaps.cabal.template > ./coll-Heaps.cabal

echo -e "Patched..."


echo -e "Patching 'Makefile.template' into 'Makefile'"

sed "s/\(--ghc-options=-\)O0/\1$optimizationOption/;s/\(--ghc-options=\"-\)O0/\1$optimizationOption/" ./Makefile.template > ./Makefile

echo -e "Patched..."


