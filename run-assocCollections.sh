#!/bin/bash

ITEMS=(assocCollections)

OPT_OPTIONS=(O0 O1 O2)


## ##########

function patchFilesForOptOption () {

    echo -e "    ${RED}Started patching files for '$1'${NC}\n"

    cd ./sources/benchmarkForOneAssocCollectionImpl/ ; sh ./patch.sh $1 ; cd ../..

    cd ./sources/common/ ; sh ./patch.sh $1 ; cd ../..
 
    cd ./sources/compileForAllAssocCollectionImplementations/ ; sh ./patch.sh $1 ; cd ../..

    cd ./sources/runForAllBenchmarkTypes/ ; sh ./patch.sh $1 ; cd ../..

    echo -e "    ${RED}Finished patching files for '$1'${NC}\n"


}


## ##########

function main () {

    for item in ${ITEMS[*]}
    do
        echo -e "\n\nEntering ${item}...\n\n"
        cd ${item}
        pwd

        for optOption in ${OPT_OPTIONS[*]}
        do
            bash ./patch.sh ${optOption}
            patchFilesForOptOption ${optOption}

            make 2>&1 | tee fullOutput-${optOption}.txt

            mv csvFileSets csvFileSets-${optOption}

        done

        cd ..
        echo -e "\n\nDone ${item}...\n\n"

    done

}

main


