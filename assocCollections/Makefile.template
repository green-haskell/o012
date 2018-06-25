#!/bin/bash

assocCollectionImplementations = AssocList \
StandardMap


main:
	for assocCollectionImplementation in $(assocCollectionImplementations) ; \
		do \
		echo -e "\n\nProcessing "$$assocCollectionImplementation"...\n\n" ; \
		date ; \
		cabal configure --ghc-options=-O0 ; \
		cabal build compileForAllAssocCollectionImplementations --ghc-options="-O0 -fforce-recomp" ; \
		cp assocCollectionImplementations/$$assocCollectionImplementation.txt ./assocCollectionImplementations.txt ; \
		mkdir -p tmp && mkdir -p tmp/executables ; \
		./dist/build/compileForAllAssocCollectionImplementations/compileForAllAssocCollectionImplementations ; \
		cabal configure --ghc-options=-O0 ; \
		cabal build runForAllBenchmarkTypes --ghc-options="-O0 -fforce-recomp" ; \
		modprobe msr ; \
		./dist/build/runForAllBenchmarkTypes/runForAllBenchmarkTypes ; \
		chown $(USER):users time-Time.csv packageEnergy-Energy.csv dramEnergy-Energy.csv; \
		mkdir -p csvFileSets ; \
		mv time-Time.csv csvFileSets/$$assocCollectionImplementation.time.csv ; \
		mv packageEnergy-Energy.csv csvFileSets/$$assocCollectionImplementation.packageEnergy.csv ; \
		mv dramEnergy-Energy.csv csvFileSets/$$assocCollectionImplementation.dramEnergy.csv ; \
		date ; \
		rm -fr dist/ ; \
	done


clean :
	cabal clean
	rm -f tmp/executables/*


