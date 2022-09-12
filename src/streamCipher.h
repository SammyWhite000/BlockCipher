#ifndef STREAM_CIPHER 
#define STREAM_CIPHER

#include <string> 
#include <iostream> 
#include <fstream>
#include <sstream>

void test1();
std::string streamXOR(std::string message, std::string key);
std::string fileIngest(char message_file[]);
void encryptStream(char* argv[]);
void decryptStream(char* argv[]);
void writeStream(std::string message, std::string fileName);
void beginStream(char *argv[]);

#endif 