#!/bin/bash

heapImplementations = LazyPairingHeap \
LeftistHeap \
SkewHeap \
SplayHeap


main:
	for heapImplementation in $(heapImplementations) ; \
		do \
		echo -e "\n\nProcessing "$$heapImplementation"...\n\n" ; \
		date ; \
		cabal configure --ghc-options=-O0 ; \
		cabal build compileForAllHeapImplementations --ghc-options="-O0 -fforce-recomp" ; \
		cp heapImplementations/$$heapImplementation.txt ./heapImplementations.txt ; \
		mkdir -p tmp && mkdir -p tmp/executables ; \
		./dist/build/compileForAllHeapImplementations/compileForAllHeapImplementations ; \
		cabal configure --ghc-options=-O0 ; \
		cabal build runForAllBenchmarkTypes --ghc-options="-O0 -fforce-recomp" ; \
		modprobe msr ; \
		./dist/build/runForAllBenchmarkTypes/runForAllBenchmarkTypes ; \
		chown $(USER):users time-Time.csv packageEnergy-Energy.csv dramEnergy-Energy.csv; \
		mkdir -p csvFileSets ; \
		mv time-Time.csv csvFileSets/$$heapImplementation.time.csv ; \
		mv packageEnergy-Energy.csv csvFileSets/$$heapImplementation.packageEnergy.csv ; \
		mv dramEnergy-Energy.csv csvFileSets/$$heapImplementation.dramEnergy.csv ; \
		date ; \
		rm -fr dist/ ; \
	done


clean :
	cabal clean
	rm -f tmp/executables/*


