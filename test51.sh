#!/bin/bash
d=`date +%F`
tar -cvf $d.tar.gz `find ./ -type f -size -5k| xargs`
