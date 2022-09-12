#include "streamCipher.h"


// Get Message and Key from Files
std::string fileIngest(char message_file[]){
    std::string file = message_file; 
    std::ifstream t(message_file);
    std::stringstream buffer;
    buffer << t.rdbuf();
    std::string message = buffer.str();
    return message;
}

// Algorithm, XOR Message with Key
std::string streamXOR(std::string message, std::string key){
    std::string result;
    int keyIndex = 0;
    for(int block = 0; block < int(message.length()); block++){
        if(keyIndex == int(key.length())){
            keyIndex = 0;
        }
        result += key[keyIndex] ^ message[block]; 
        keyIndex++;
    }
    return result;
}

// Write Encrypted Message to a File
void writeStream(std::string message, std::string fileName){
    std::ofstream out(fileName);
    out << message;
    out.close();
}
void encryptStream(char* argv[]){
    std::string key = fileIngest(argv[4]);
    std::string encrypt = streamXOR(fileIngest(argv[2]), key);
    std::cout << "Got: " << encrypt << '\n';
    writeStream(encrypt, argv[3]);
}

void decryptStream(char* argv[]){
    std::string key = fileIngest(argv[4]);
    std::string decrypt = streamXOR(fileIngest(argv[3]), fileIngest(argv[4]));
    std::cout << "Got: " << decrypt << '\n';
    writeStream(decrypt, argv[3]);
}

void beginStream(char *argv[]){
    if(*argv[5] == 'E'){
        encryptStream(argv);
    }
    else{
        decryptStream(argv);
    }
    

}