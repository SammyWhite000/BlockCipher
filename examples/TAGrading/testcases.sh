#!/bin/bash
echo "Check S/B E"
./cipher A empty.txt out.txt key2.txt E
echo "*************"
echo "Check S/B D"
./cipher A empty.txt out.txt key2.txt D
echo "*************"
echo "Check E/D S"
./cipher S empty.txt out.txt key2.txt X
echo "*************"
echo "Check E/D B"
./cipher B empty.txt out.txt key2.txt X
echo "---------2----------"
echo "Check file exist or not"
echo "File-1"
./cipher B empt.txt out.txt key2.txt E
echo "File-2"
./cipher B empty.txt out.txt ky.txt E
echo "File-3"
./cipher S empt.txt out.txt key2.txt E
echo "File-4"
./cipher S empty.txt out.txt ky.txt E
echo "----------3------------"
echo "B Empty Check E"
./cipher B empty.txt out1.txt key2.txt E
diff out1.txt empty.txt
echo "*************"
echo "B Empty Check D"
./cipher B empty.txt out2.txt key2.txt D
diff out2.txt empty.txt 
echo "*************"
echo "S Empty Check E"
./cipher S empty.txt out3.txt key2.txt E
diff out3.txt empty.txt
echo "*************"
echo "S Empty Check D"
./cipher S empty.txt out4.txt key2.txt D
diff out4.txt empty.txt
echo "----------4------------"
echo "B Input-1 E"
./cipher B input1.txt out5.txt key1.txt E
diff out5.txt bout11.txt
echo "*************"
echo "B out D"
./cipher B bout11.txt out6.txt key1.txt D
diff out6.txt input1.txt
echo "*************"
echo "B Input-2 E"
./cipher B input2.txt out7.txt key2.txt E
diff out7.txt bout22.txt
echo "*************"
echo "B out D"
./cipher B bout22.txt out8.txt key2.txt D
diff out8.txt input2.txt
echo "*************"
echo "B Input-3 E"
./cipher B input3.txt out9.txt key3.txt E
diff out9.txt bout33.txt
echo "*************"
echo "B out D"
./cipher B bout33.txt out10.txt key3.txt D
diff out10.txt input3.txt
echo "-----------------------"
echo "S Input-1 E"
./cipher S input1.txt out11.txt key3.txt E
diff out11.txt sout13.txt
echo "*************"
echo "S out D"
./cipher S sout13.txt out12.txt key3.txt D
diff out12.txt input1.txt
echo "*************"
echo "S Input-2 E"
./cipher S input2.txt out13.txt key4.txt E
diff out13.txt sout24.txt
echo "*************"
echo "S out D"
./cipher S sout24.txt out14.txt key4.txt D
diff out14.txt input2.txt

