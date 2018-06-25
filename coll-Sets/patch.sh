#!/bin/bash


optimizationOption=$1


echo -e "Patching 'coll-Sets.cabal.template' into 'coll-Sets.cabal'"

sed "s/\(\s*ghc-options:\s*\)-O0/\1-$optimizationOption/" ./coll-Sets.cabal.template > ./coll-Sets.cabal

echo -e "Patched..."


echo -e "Patching 'Makefile.template' into 'Makefile'"

sed "s/\(--ghc-options=-\)O0/\1$optimizationOption/;s/\(--ghc-options=\"-\)O0/\1$optimizationOption/" ./Makefile.template > ./Makefile

echo -e "Patched..."


