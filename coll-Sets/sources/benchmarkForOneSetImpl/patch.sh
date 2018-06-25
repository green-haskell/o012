#!/bin/bash


optimizationOption=$1


echo -e "Patching 'Main.hs.template' into 'Main.hs'"

sed "s/{-# OPTIONS_GHC -O0 #-}/{-# OPTIONS_GHC -$optimizationOption #-}/" ./Main.hs.template > ./Main.hs

echo -e "Patched..."


