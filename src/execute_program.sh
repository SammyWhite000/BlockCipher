#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

make_exec(){
    cd ../src
    make
    echo ""
    printf "${GREEN}Beginning Tests!${NC}\n"
}

test_arguments(){    

    # Verify first arguments
    printf "${RED}First Arg Tests!${NC}\n"
    ./Target A fileMessage.txt out keyfile.txt E
    ./Target S fileMessage.txt out keyfile.txt E
    ./Target B fileMessage.txt out keyfile.txt D
    echo ""

    printf "${RED}Second Arg Tests!${NC}\n"
    ./Target S test.txt out keyfile.txt E
    ./Target B random.txt out keyfile.txt D
    ./Target S fileMessage.txt out keyfile.txt D
    echo ""

    printf "${RED}Fifth Arg Tests!${NC}\n"
    ./Target S fileMessage.txt out keyfile.txt E
    ./Target B fileMessage.txt out keyfile.txt D
    ./Target S fileMessage.txt out keyfile.txt F
    ./Target S fileMessage.txt out keyfile.txt K
    echo ""

    # Clean Up Not Needed Files
    make clean
}

execute_prog(){
    printf "${BLUE}Testing Block Cipher!${NC}\n"

    printf "${RED}Test Encryption!${NC}\n"
    echo "Expected: ��8#G=ArEXZ^FrU 8%(=9,><c]QZGBR54(o1Y\TV6u$'"
    ./Target B fileMessage.txt out.txt key.txt E
    echo ""

    printf "${RED}Test Decryption!${NC}\n"
    echo "Expected: This is a another example with a sample input"
    ./Target B fileMessage.txt out.txt key.txt D
    echo ""

    rm out.txt

    printf "${BLUE}Testing Stream Cipher!${NC}\n"

    printf "${RED}Test Encryption!${NC}\n"
    echo "Expected: '\$#u=6rVTZ\FYU1o((495>RB]GZQc<,=%8 r^XEAG8"
    ./Target S fileMessage.txt out.txt key.txt E
    echo ""

    printf "${RED}Test Decryption!${NC}\n"
    echo "Expected: This is a another example with a sample input"
    ./Target S fileMessage.txt out.txt key.txt D
    echo ""

    make clean
}

main(){
    # Make executable file
    make_exec
    echo ""

    execute_prog
}

main