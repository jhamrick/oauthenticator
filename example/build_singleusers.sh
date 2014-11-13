#!/bin/sh

IFS="
"
for line in `cat userlist`; do
  test -z "$line" && continue
  userpart=`echo $line | cut -f 1 -d' '`
  user=`echo $userpart | cut -f 1 -d':'`
  userid=`echo $userpart | cut -f 2 -d':'`
  echo "Building container for user $user ($userid)"
  echo $user:$userid > singleuser/user
  docker build -t jhamrick/singleuser:$user singleuser
done
