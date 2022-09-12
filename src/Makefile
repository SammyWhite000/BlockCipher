CPPFLAGs= -g -Wall
CC=g++

Target: main.o blockCipher.o streamCipher.o
	$(CC) $(CPPFLAGs) -o Target main.o blockCipher.o streamCipher.o

blockCipher.o: blockCipher.h blockCipher.cc 
	$(CC) $(CPPFLAGs) -c blockCipher.h blockCipher.cc  

streamCipher.o: streamCipher.h streamCipher.cc 
	$(CC) $(CPPFLAGs) -c streamCipher.h streamCipher.cc

main.o: main.cc
	$(CC) $(CPPFLAGs) -c main.cc

clean:
	$(RM) main.o streamCipher.o blockCipher.o Target blockCipher.h.gch streamCipher.h.gch
