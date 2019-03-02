#!/bin/sh
# File Backup Script

MDNAME=`basename $0`
BKDIR="BACKUP"
TODAY=`date +%Y%m%d`
JOIN="."
CNT=01
i=1

if [ $# -ne 1 ]; then
 echo "Usage: $CMDNAME file1 " 1>&2
 exit 1
fi

if [ ! -e $1 ]; then
 echo "$1 not found"
 exit 1
fi

DSTFL=`basename $1`

if [ ! -e $BKDIR ]; then
 mkdir $BKDIR
fi

BKFL="./$BKDIR/$DSTFL$JOIN$TODAY"_"$CNT"

while [ -e $BKFL ]
do
i=`expr $i + 1`
CNT=`printf %02d $i`
BKFL="./$BKDIR/$DSTFL$JOIN$TODAY"_"$CNT"
done

cp -ip $1 $BKFL

exit 0

