#!/bin/bash

mkdir ~/nobackup/diacritics
mkdir ~/nobackup/diacritics/data
mkdir ~/nobackup/diacritics/model
curl --remote-name-all https://lindat.mff.cuni.cz/repository/xmlui/bitstream/handle/11234/1-2607/cs.zip ~/nobackup/diacritics/data

unzip ~/nobackup/cs.zip ~/nobackup/diacritics/data

rm ~/nobackup/diacritics/data/cs.zip


