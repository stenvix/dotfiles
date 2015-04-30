#!/bin/sh
SORCE=/tmp/Storage
DEST=$HOME/Storage;
if [ ! -z  `ls -d /tmp/afuse-* 2>/dev/null`  ]; then
  echo 'Afuse is already running'; 
else
  if [ ! -d $SORCE ]; then
    mkdir $SORCE ;
  else
    echo 'Dir is here';
  fi
  /usr/bin/afuse -o mount_template="sshfs %r:/suser/Storage %m" -o unmount_template="fusermount -u -z %m" $SORCE;
  ls $SORCE/hs;

  if [ ! -L $DEST ]; then
    ln -s $SORCE/hs $DEST; 
  else
    echo 'Link is exist';
  fi
fi
