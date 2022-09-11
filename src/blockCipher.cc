#include "blockCipher.h"

//using namespace std;

void test(){
    std::cout << "All Tests Passed!" << std::endl;
}

// Write Encrypted Message to a File
void writeFile(std::string encrypt, std::string fileName){
    std::ofstream out(fileName);
    out << encrypt;
    out.close();
}

// Get Message and Key from Files
std::string getFileContent(char message_file[], std::string newline){
    std::string file = message_file; 
    // std::string message; std::ifstream inFile;
    // inFile.open(message_file);
    // getline(inFile, message);
    // inFile.close();

    std::ifstream t(message_file);
    std::stringstream buffer;
    buffer << t.rdbuf();
    buffer.ignore();
    std::string message = buffer.str();
    message += newline;
    return message;
}

// Determine number of bytes of padding needed
int deterPadding(std::string message){
    int message_length = message.length();
    //std::cout << "length " << message_length << '\n';
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

// Swap elements Based On Algorithm
std::string swapAlg(std::string xORMessage, std::string key){

    char *first_element = &xORMessage.front();
    char *last_element = &xORMessage.back();
    std::cout<<xORMessage<<'\n';
    std::cout<<*first_element<<'\n';
    int key_index = 0;
    while(first_element != last_element){
        if(key_index == int(key.length()))
            key_index = 0;

        // Swap First and Last Pointer
        if(int(key[key_index])%2 == 1){
            char temp = *first_element;
            *first_element = *last_element;
            *last_element = temp;
            first_element += 1;
            last_element -= 1;
            key_index++;
        }
        else{
            key_index++;
            first_element += 1;
        }
    }
    std::cout<<xORMessage<<'\n';
    return xORMessage;
}

// Algorithm, XOR Message with Key
std::string xOR(std::string updatedMessage, std::string key){
    std::string result;
    for(int block = 0; block < int(updatedMessage.length()/16); block++){
        for(int byte = 0; byte < 16; byte++){
            result += key[byte] ^ updatedMessage[block * 16 + byte]; 
        }
    }
    return result;
}

// Facilitate Message Encryption 
void encrypMessage(char* argv[]){

    // Get the Message and then the key
    std::string message = getFileContent(argv[2], "\n");
    std::string key = getFileContent(argv[4], "");

    // Get the new message with padding
    std::string updatedMessage = addPadding(message); 
    std::string xORMessage = xOR(updatedMessage, key);
    std::string encrypt = swapAlg(xORMessage, key);
    writeFile(encrypt, argv[3]);

}

// Decrypt Message
void decryptMessage(char* argv[]){
    std::cout << "Decrypt Working" << '\n';
}

// Determine Encryption or Decryption 
void beginCipher(char *argv[]){
    std::cout << "Begin Cipher Working" << '\n';
    if(*argv[5] == 'E')
        encrypMessage(argv);
    else if (*argv[5] == 'D'){
        decryptMessage(argv);
    }
}
