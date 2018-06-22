#!/bin/bash

sequenceImplementations = BankersQueue \
BinaryRandList \
BraunSeq \
FingerSeq \
JoinList \
ListSeq \
RandList \
SimpleQueue

#MyersStack


main:
	for sequenceImplementation in $(sequenceImplementations) ; \
		do \
		echo -e "\n\nProcessing "$$sequenceImplementation"...\n\n" ; \
		date ; \
		cabal configure --ghc-options=-O0 ; \
		cabal build compileForAllSequenceImplementations --ghc-options="-O0 -fforce-recomp" ; \
		cp sequenceImplementations/$$sequenceImplementation.txt ./sequenceImplementations.txt ; \
		mkdir -p tmp && mkdir -p tmp/executables ; \
		./dist/build/compileForAllSequenceImplementations/compileForAllSequenceImplementations ; \
		cabal configure --ghc-options=-O0 ; \
		cabal build runForAllBenchmarkTypes --ghc-options="-O0 -fforce-recomp" ; \
		modprobe msr ; \
		./dist/build/runForAllBenchmarkTypes/runForAllBenchmarkTypes ; \
		chown $(USER):users time-Time.csv packageEnergy-Energy.csv dramEnergy-Energy.csv; \
		mkdir -p csvFileSets ; \
		mv time-Time.csv csvFileSets/$$sequenceImplementation.time.csv ; \
		mv packageEnergy-Energy.csv csvFileSets/$$sequenceImplementation.packageEnergy.csv ; \
		mv dramEnergy-Energy.csv csvFileSets/$$sequenceImplementation.dramEnergy.csv ; \
		date ; \
		rm -fr dist/ ; \
	done


clean :
	cabal clean
	rm -f tmp/executables/*


