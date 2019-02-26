#!/bin/bash
file_n=./info/1.txt
sed -n '1,5p' $file_n >/tmp/file1-5.txt
sed -n '6,$p' $file_n >/tmp/file6.txt
echo -e "# This is a test file. \n# This is a test for insert." >>/tmp/file1-5.txt
cat /tmp/file6.txt >>/tmp/file1-5.txt
more /tmp/file1-5.txt
