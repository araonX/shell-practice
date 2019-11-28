#!/bin/bash
[ $# -lt 1 ] && echo "you must input atlese one args" && exit 20
echo "you have $# args."
space_lines=$(grep "^[[:space:]]*$" $1 | wc -l )
echo "first args file have $space_lines null lines."
