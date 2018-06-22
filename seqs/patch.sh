#!/bin/bash


optimizationOption=$1


echo -e "Patching 'seqs.cabal.template' into 'seqs.cabal'"

sed "s/\(\s*ghc-options:\s*\)-O0/\1-$optimizationOption/" ./seqs.cabal.template > ./seqs.cabal

echo -e "Patched..."


echo -e "Patching 'Makefile.template' into 'Makefile'"

sed "s/\(--ghc-options=-\)O0/\1$optimizationOption/;s/\(--ghc-options=\"-\)O0/\1$optimizationOption/" ./Makefile.template > ./Makefile

echo -e "Patched..."


