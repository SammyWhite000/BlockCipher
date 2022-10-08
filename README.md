# Encryption and Decryption Algorithm
> Samuel White
> CS356
## Execute Instructions

1. There is a tar file called SamuelWhite_Encryption.tar
    * Move this tar file into the directory where you would like the program files to be stored

2. Extract the tar file by running the below command. It should exapnd with all of the necessary program files
    * tar -xvf SamuelWhite_Encryption.tar

3. There should be 3 .cc files, two .h files, and one Makefile. Make it how we will execute our program.
    * There should also be two .txt files, these are necessary to the program, but they were used for testing.

4. To make an executable file, type "make" into the console where all of the files are located. 
    * This should generate some extra files, among one of them there should be an executable called "Target"
    * This is what will run your program

5. To execute the program type "./Target" into the console with the needed parameters.
    * The needed parameters are listed below

6. The Program takes 5 arguments in the following order:
    1. Character that is either 'S' or 'B' which will determine if the program will execute as a block or stream cipher
    2. Name of file that contains the mesage to be encrypted and decrypted
    3. Name of file that the encryption and decryption will be written to
    4. Name of file that holds the key to encryption and decryption
    5. Character that is either 'E' or 'D' which will determine if the program will execute an encryption or decryption

    * Example: ./Target B fileMessage.txt out.txt key.txt E

7. Once the program is run in encyption mode, the output file, that was specififed in the arguments, will hold the binary values

8. When the program in run in decryption mode, after encryption, the output file will hold the original message