#!/bin/sh

IFS="
"
for line in `cat userlist`; do
  test -z "$line" && continue
  userid=`echo $line | cut -f 1 -d' '`
  user=`echo $userid | cut -f 1 -d':'`
  id=`echo $userid | cut -f 2 -d':'`
  echo "adding user $user ($id)"
  useradd -u $id -s /bin/bash $user
done
