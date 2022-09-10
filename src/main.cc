#include <iostream>
#include <fstream>
#include <string>
#include "blockCipher.h"

using namespace std;

// Verify the different letter arguments
void verifyLetterArg(char *argv[], int argIndex){
    if(argIndex == 1){
        if(*argv[argIndex] != 'S' && *argv[argIndex] != 'B'){
            cerr << "Incorrect First Arguments!" << "\n";
            exit(-1);
        }
    }
    else if(argIndex == 5){
        if(*argv[argIndex] != 'E' && *argv[argIndex] != 'D'){
            cerr << "Incorrect Fifth Arguments!" << "\n";
            exit(-1);
        }
    }
}

void verifySecondArg(char argv[]){
    string fileName = argv;
    ifstream fileMessage;
    fileMessage.open("../Resources/" + fileName);

    if(!fileMessage){
        cerr << "That File Does Not Exist!" << "\n";
        exit(-1);
    }
}

//Verify all arguments are correct
void verifyArguments(char *argv[]){
    // Verify First Arg
    verifyLetterArg(argv, 1);
    // Verify Second Arg
    verifySecondArg(argv[2]);
    // Verify Fifth Arg
    verifyLetterArg(argv, 5);
}

int main(int argc, char *argv[])
{
    verifyArguments(argv);



    test();

    return 0;
}