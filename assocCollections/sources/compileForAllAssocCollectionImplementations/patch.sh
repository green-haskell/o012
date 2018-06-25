#!/bin/bash


optimizationOption=$1


echo -e "Patching 'Main.hs.template' into 'Main.hs'"

sed "s/--ghc-options=-O0/--ghc-options=-$optimizationOption/;s/--ghc-options='-O0/--ghc-options='-$optimizationOption/" ./Main.hs.template > ./Main.hs

echo -e "Patched..."
