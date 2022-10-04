#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

start_message(){
    printf "${GREEN}Starting Block Cipher Program${NC}\n"
}

# Run make file and create executable 
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

execute_block(){
    printf "${BLUE}Testing Block Cipher!${NC}\n"

    printf "${RED}Test Encryption!${NC}\n"
    ./Target B fileMessage.txt out.txt key.txt E

    # test difference btween out.txt and TA Example
    printf "${RED}Test Difference in Output!${NC}\n"
    diff out.txt ../examples/UpdatedTestTA/Encryption/outputBlockEncryption.txt

    printf "${RED}Test Decryption!${NC}\n"
    ./Target B fileMessage.txt out.txt key.txt D
    diff out.txt ../examples/UpdatedTestTA/Decryption/outputBlockDecrypt.txt
    echo ""

    make clean
}

execute_stream(){
    printf "${BLUE}Testing Stream Cipher!${NC}\n"

    printf "${RED}Test Encryption!${NC}\n"
    ./Target S fileMessage.txt out.txt key.txt E


    printf "${RED}Test Decryption!${NC}\n"
    ./Target S fileMessage.txt out.txt keyfile.txt D

    make clean
}

# Indicate end of test
end_message(){  
    printf "${GREEN}Ending Encryption Program${NC}\n"
}

main(){
    # Make executable file
    make_exec
    echo ""

    # test_arguments # Test that the arguments are working
    execute_block
    #execute_stream
    echo ""

    end_message
    echo ""
}

main