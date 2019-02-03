#!/bin/bash
sed -n '1,5'p ../info/1.txt | sed '/[a-zA-Z]/d'>> ../info/1.txt.end
sed '1,5d' ../info/1.txt | sed '1,5s/[a-zA-Z]//g' >>../info/1.txt.end
 
