#!/bin/bash
etc_f_count=$(ls -ld /etc/* | wc -l )
var_f_count=$(ls -ld /var/* | wc -l )
usr_f_count=$(ls -dl /usr/* | wc -l )
echo "f_count: $[$etc_f_count+$var_f_count+$usr_f_count]"
