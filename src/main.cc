#include <iostream>
#include <fstream>
#include <string>
#include "blockCipher.h"
#include "streamCipher.h"

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
    fileMessage.open(fileName);

    if(!fileMessage){
        cerr << fileName << " Does Not Exist!" << "\n";
        exit(-1);
    }
}

void zeroArgs(int argc){
    if (argc == 1){
        cerr << "No Arguments were given!" << "\n";
        exit(-1);
    }
}



//Verify all arguments are correct
void verifyArguments(int argc, char *argv[]){
    // Verify arguments were given
    zeroArgs(argc);

    // Verify First Arg
    verifyLetterArg(argv, 1);
    // Verify Second Arg
    verifySecondArg(argv[2]);
    verifySecondArg(argv[4]);
    // Verify Fifth Arg
    verifyLetterArg(argv, 5);
}

int main(int argc, char *argv[])
{
    verifyArguments(argc, argv);
    if(*argv[1] == 'B'){
        beginCipher(argv);
    }
    else{
        beginStream(argv);
    }
    

    return 0;
}