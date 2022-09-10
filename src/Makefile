CPPFLAGs= -g -Wall
CC=g++

Target: main.o blockCipher.o
	$(CC) $(CPPFLAGs) -o Target main.o blockCipher.o

blockCipher.o: blockCipher.h blockCipher.cc 
	$(CC) $(CPPFLAGs) -c blockCipher.h blockCipher.cc  

main.o: main.cc
	$(CC) $(CPPFLAGs) -c main.cc

clean:
	$(RM) main.o blockCipher.o Target blockCipher.h.gch
