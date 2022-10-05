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
    ./Target A fileMessage.txt out.txt key.txt E
    ./Target op fileMessage.txt out.txt key.txt E
    ./Target k fileMessage.txt out.txt key.txt D
    ./Target z fileMessage.txt out.txt key.txt D
    echo ""

    printf "${RED}Second Arg Tests!${NC}\n"
    ./Target S test.txt out.txt key.txt E
    ./Target B random.txt out.txt key.txt D
    ./Target S eeeee.txt out.txt key.txt D
    echo ""

    printf "${RED}Fourth Arg Tests!${NC}\n"
    ./Target S fileMessage.txt out.txt key1.txt E
    ./Target B fileMessage.txt out.txt stuff.txt D
    ./Target S fileMessage.txt out.txt reee.txt F
    ./Target S fileMessage.txt out.txt lll.txt K
    echo ""

    printf "${RED}Fifth Arg Tests!${NC}\n"
    ./Target S fileMessage.txt out.txt key.txt mn
    ./Target B fileMessage.txt out.txt key.txt cool
    ./Target S fileMessage.txt out.txt key.txt F
    ./Target S fileMessage.txt out.txt key.txt K
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
    diff out.txt ../examples/TestCases/Encryption/outputBlockEncryption.txt

    printf "${RED}Test Decryption!${NC}\n"
    ./Target B fileMessage.txt out.txt key.txt D
    diff out.txt ../examples/TestCases/Decryption/outputBlockDecryption.txt
    echo ""

    make clean
}

execute_stream(){
    printf "${BLUE}Testing Stream Cipher!${NC}\n"

    printf "${RED}Test Encryption!${NC}\n"
    ./Target S fileMessage.txt out.txt key.txt E

    # test difference btween out.txt and TA Example
    printf "${RED}Test Difference in Output!${NC}\n"
    diff out.txt ../examples/TestCases/Encryption/outputStreamEncryption.txt


    printf "${RED}Test Decryption!${NC}\n"
    ./Target S fileMessage.txt out.txt key.txt D
    diff out.txt ../examples/TestCases/Decryption/outputStreamDecryption.txt

    make clean
}

ta_grading(){
    echo ""
    printf "${GREEN}TA Testing!${NC}\n"
    cp Target ../examples/TAGrading/
    cd ../examples/TAGrading/ 
    mv Target cipher
    ./testcases.sh
    rm cipher
}

# Indicate end of test
end_message(){  
    printf "${GREEN}Ending Encryption Program${NC}\n"
}

main(){
    # Make executable file
    make_exec
    echo ""

    test_arguments # Test that the arguments are working
    make_exec
    execute_block

    make_exec
    execute_stream
    echo ""

    end_message
    echo ""
}

main