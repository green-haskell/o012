#!/bin/bash


optimizationOption=$1


echo -e "Patching 'Ops.hs.template' into 'Ops.hs'"

sed "s/{-# OPTIONS_GHC -O0 #-}/{-# OPTIONS_GHC -$optimizationOption #-}/" ./Ops.hs.template > ./Ops.hs

echo -e "Patched..."
