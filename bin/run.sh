#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

start_message(){
    printf "${GREEN}Starting Block Cipher Program${NC}\n"
}

# Run make File
make_exec(){
    cd ../src
    make
    echo ""
    printf "${GREEN}Beginning Tests!${NC}\n"
}

# Commands to run program
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

execute_program(){

    printf "${RED}Test Encryption!${NC}\n"
    ./Target S input.txt out.txt keyfile.txt E
    echo ""
    printf "${RED}Test Decryption!${NC}\n"
    #./Target B fileMessage.txt out.txt keyfile.txt E
    echo ""

    make clean
}

# Indicate end of test
end_message(){  
    printf "${GREEN}Ending Block Cipher Program${NC}\n"
}

main(){
    start_message
    # Make executable file
    make_exec
    # test_arguments # Test that the arguments are working
    execute_program
    echo ""
    end_message
    echo ""
}

main