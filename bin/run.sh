#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m' # No Color


start_message(){
    printf "${GREEN}Starting Block Cipher Program${NC}\n"
}

execute_program(){
    cd ../src
    make
    echo ""
    printf "${GREEN}Beginning Tests!${NC}\n"
    ./Target
    make clean
}

end_message(){  
    printf "${GREEN}Ending Block Cipher Program${NC}\n"
}

main(){
    start_message
    execute_program
    echo ""
    end_message
}

main