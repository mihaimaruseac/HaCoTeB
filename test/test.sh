#!/bin/bash

cleanup(){
    chmod -x test.sh
    for i in *; do
        if [ -L $i ]; then rm $i; fi
        if [ -x $i -a -f $i ]; then rm $i; fi
    done

    rm -f *.o *.hi

    chmod +x test.sh
}

usage(){
    echo "./test.sh [arg]"
    echo -e "\tc\t:\tclean dir"
}

dotest(){
    ln -s ../src/HaCoTeB 
    ghc --make Splitter.hs &>/dev/null
    ./Splitter
    cleanup
}

if [ $# -eq 0 ]; then
    dotest
elif [ $1 == 'c' ]; then
    cleanup
else
    usage
fi

