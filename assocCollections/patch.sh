#!/bin/bash


optimizationOption=$1


echo -e "Patching 'assocCollections.cabal.template' into 'assocCollections.cabal'"

sed "s/\(\s*ghc-options:\s*\)-O0/\1-$optimizationOption/" ./assocCollections.cabal.template > ./assocCollections.cabal

echo -e "Patched..."


echo -e "Patching 'Makefile.template' into 'Makefile'"

sed "s/\(--ghc-options=-\)O0/\1$optimizationOption/;s/\(--ghc-options=\"-\)O0/\1$optimizationOption/" ./Makefile.template > ./Makefile

echo -e "Patched..."


