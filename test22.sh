#!/bin/bash
dir=/data/web
[ -f /tmp/md5.list ] && rm -f /tmp/md5.list
find $dir/ -type f >/tmp/file.list
while read line
  do 
    md5sum $line >>/tmp/md5.list
  done < /tmp/file.list
scp /tmp/md5.list B:/tmp/

[ -f /tmp/md5_check.sh ] && rm -f /tmp/md5_check.sh
cat > /tmp/md5_check.sh << EOF
#!/bin/bash
dir=/data/web
n=\`wc -l /tmp/md5.list| awk '{print \$1}'\`
for i in \`seq 1 $n\`
  do 
    file_name=\` sed -n "\$i"p /tmp/md5.list | awk '{print \$2}'\`
    md5=\` sed -n "\$i"p /tmp/md5.list | awk '{print \$1}'\`
    if [ -f \$file_name ];then
      md5_b=\` md5sum \$filename\`
      if [ \$md5_b !=  \$md5 ];then
        echo "$file_name is changed."
      fi
    else
      echo "$file_name is lose."
    fi
  done
EOF
scp /tmp/md5_check.sh B:/tmp/
ssh B "/bin/bash /tmp/md5_check.sh"


