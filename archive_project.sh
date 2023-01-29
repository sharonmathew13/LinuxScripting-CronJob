#!/bin/bash

BASE='/vagrant'

#Check the presence of Base directory
if [[ ! -d ${BASE} ]]
then
  echo "Your Directory is not present"
  exit 1
fi 

#Create archive directory if not found

if [[ ! -d ${BASE}/archive ]]
then
  mkdir ${BASE}/archive
fi


#Find the directory of size above 1MB and move them to archieve directory

for FILE in $(find "${BASE}" -type f -size +1M)
do  
    echo 
    echo "$(date) archiving ${FILE} == > ${BASE}/archive"
    gzip ${FILE}
    mv ${FILE}.gz ${BASE}/archive
done
exit 0
