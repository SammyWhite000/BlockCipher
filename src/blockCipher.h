#ifndef BLOCK_CIPHER 
#define BLOCK_CIPHER

#include <string> 
#include <iostream> 
#include <fstream>
#include <sstream>

void test();
std::string getFileContent();
std::string addPadding(std::string message);
std::string xOR(std::string updatedMessage, std::string key);
int deterPadding(std::string message);
void beginCipher(char *argv[]);

#endif 