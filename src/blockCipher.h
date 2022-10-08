#ifndef BLOCK_CIPHER 
#define BLOCK_CIPHER

#include <string> 
#include <iostream> 
#include <fstream>
#include <sstream>
#include <algorithm>

void writeFile(std::string encrypt, std::string fileName);
void encrypMessage(char* argv[]);
void decryptMessage(char* argv[]);
std::string getFileContent(char message_file[]);
std::string addPadding(std::string message);
std::string swapAlg(std::string xORMessage);
std::string xOR(std::string updatedMessage, std::string key);
int deterPadding(std::string message);
void beginCipher(char *argv[]);

#endif 