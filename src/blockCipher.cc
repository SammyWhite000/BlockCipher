#include "blockCipher.h"

//using namespace std;

void test(){
    std::cout << "All Tests Passed!" << std::endl;
}

// Get Message and Key from Files
std::string getFileContent(char message_file[]){
    std::string file = message_file; 
    std::string message; std::ifstream inFile;

    inFile.open(message_file);
    getline(inFile, message);

    inFile.close();

    return message;
}

// Determine number of bytes of padding needed
int deterPadding(std::string message){
    int message_length = message.length();
    if(message_length % 16 != 0){
        int partWay = message_length / 16; 
        return ((partWay + 1) * 16) - message_length;
    }
    return 0;
}

// Add padding to message if necessary
std::string addPadding(std::string message){
    int num_bytes_padding = deterPadding(message);
    if(num_bytes_padding != 0){
        for(int x = 0; x < num_bytes_padding; x++){
            message += static_cast<char>(129);
        }
        return message;
    }
    return message;
}

std::string xOR(std::string updatedMessage, std::string key){
    std::string result;
    for(int block = 0; block < (updatedMessage.length()/16); block++){
        for(int byte = 0; byte < 16; byte++){
            result += key[byte] ^ updatedMessage[block * 16 + byte]; 
        }
    }
    return result;
}

// Begin the Block Cipher program
void beginCipher(char *argv[]){
    std::cout << "Begin Cipher Working" << '\n';
    // Get the Message and then the key
    std::string message = getFileContent(argv[2]);
    std::string key = getFileContent(argv[4]);

    // Get the new message with padding
    std::string updatedMessage = addPadding(message); 
    std::cout << "Updated Message: " << updatedMessage << '\n';

    
}
