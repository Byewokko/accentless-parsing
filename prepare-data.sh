#!/bin/bash

srcpath=$1
path=$2

echo "[$(date +'%T')] Making ACC dataset... "
mkdir $path/UD_Czech-ACC

echo "[$(date +'%T')] copying conlls... "

cat $srcpath/UD_Czech-PDT/cs_pdt-ud-train-c.conllu \
    $srcpath/UD_Czech-PDT/cs_pdt-ud-train-l.conllu \
    $srcpath/UD_Czech-PDT/cs_pdt-ud-train-m.conllu \
    $srcpath/UD_Czech-PDT/cs_pdt-ud-train-v.conllu \
    > $path/UD_Czech-ACC/cs_pdt-ud-train.connlu

#cp $srcpath/UD_Czech-PDT/cs_pdt-ud-train.conllu $path/UD_Czech-ACC/

cp $srcpath/UD_Czech-PDT/cs_pdt-ud-dev.conllu $path/UD_Czech-ACC/

cp $srcpath/UD_Czech-PDT/cs_pdt-ud-test.conllu $path/UD_Czech-ACC/

echo "[$(date +'%T')] extracting txts... "

python3 conll_to_text.py < $srcpath/UD_Czech-PDT/cs_pdt-ud-train.conllu \
    > $path/UD_Czech-ACC/cs_pdt-ud-train.txt
        
python3 conll_to_text.py < $srcpath/UD_Czech-PDT/cs_pdt-ud-dev.conllu \
    > $path/UD_Czech-ACC/cs_pdt-ud-dev.txt
    
python3 conll_to_text.py < $srcpath/UD_Czech-PDT/cs_pdt-ud-test.conllu \
    > $path/UD_Czech-ACC/cs_pdt-ud-test.txt

echo -e "[$(date +'%T')] DONE!\n"



nr=20
echo "[$(date +'%T')] Making DE$nr dataset... "
mkdir $path/UD_Czech-DE$nr

echo "[$(date +'%T')] deaccenting txts... "

python3 deaccent.py -p $nr -n $path/UD_Czech-DE$nr/cs_pdt-ud-train.nr \
    $path/UD_Czech-ACC/cs_pdt-ud-train.txt \
    $path/UD_Czech-DE$nr/cs_pdt-ud-train.txt
    
python3 deaccent.py -p $nr -n $path/UD_Czech-DE$nr/cs_pdt-ud-dev.nr \
    $path/UD_Czech-ACC/cs_pdt-ud-dev.txt \
    $path/UD_Czech-DE$nr/cs_pdt-ud-dev.txt
    
python3 deaccent.py -p $nr -n $path/UD_Czech-DE$nr/cs_pdt-ud-test.nr \
    $path/UD_Czech-ACC/cs_pdt-ud-test.txt \
    $path/UD_Czech-DE$nr/cs_pdt-ud-test.txt
    
echo "[$(date +'%T')] deaccenting conlls... "

python3 deaccent.py -c -l $path/UD_Czech-DE$nr/cs_pdt-ud-train.nr \
    $path/UD_Czech-ACC/cs_pdt-ud-train.conllu \
    $path/UD_Czech-DE$nr/cs_pdt-ud-train.conllu
    
python3 deaccent.py -c -l $path/UD_Czech-DE$nr/cs_pdt-ud-dev.nr \
    $path/UD_Czech-ACC/cs_pdt-ud-dev.conllu \
    $path/UD_Czech-DE$nr/cs_pdt-ud-dev.conllu
    
python3 deaccent.py -c -l $path/UD_Czech-DE$nr/cs_pdt-ud-test.nr \
    $path/UD_Czech-ACC/cs_pdt-ud-test.conllu \
    $path/UD_Czech-DE$nr/cs_pdt-ud-test.conllu

echo -e "[$(date +'%T')] DONE!\n"



nr=100
echo "[$(date +'%T')] Making DE$nr dataset... "
mkdir $path/UD_Czech-DE$nr

echo "[$(date +'%T')] deaccenting txts... "

python3 deaccent_all.py < $path/UD_Czech-ACC/cs_pdt-ud-train.txt \
    > $path/UD_Czech-DE$nr/cs_pdt-ud-train.txt

python3 deaccent_all.py < $path/UD_Czech-ACC/cs_pdt-ud-dev.txt \
    > $path/UD_Czech-DE$nr/cs_pdt-ud-dev.txt

python3 deaccent_all.py < $path/UD_Czech-ACC/cs_pdt-ud-test.txt \
    > $path/UD_Czech-DE$nr/cs_pdt-ud-test.txt
    
echo "[$(date +'%T')] deaccenting conlls... "

python3 deaccent_all.py < $path/UD_Czech-ACC/cs_pdt-ud-train.conllu \
    > $path/UD_Czech-DE$nr/cs_pdt-ud-train.conllu

python3 deaccent_all.py < $path/UD_Czech-ACC/cs_pdt-ud-dev.conllu \
    > $path/UD_Czech-DE$nr/cs_pdt-ud-dev.conllu

python3 deaccent_all.py < $path/UD_Czech-ACC/cs_pdt-ud-test.conllu \
    > $path/UD_Czech-DE$nr/cs_pdt-ud-test.conllu

echo -e "[$(date +'%T')] DONE!\n"


#ACCENT SPLITTING
echo "[$(date +'%T')] Making ACCS dataset... "
mkdir $path/UD_Czech-ACCS

echo "[$(date +'%T')] processing txts... "

python3 split_acc.py < $path/UD_Czech-ACC/cs_pdt-ud-train.txt \
    > $path/UD_Czech-ACCS/cs_pdt-ud-train.txt

python3 split_acc.py < $path/UD_Czech-ACC/cs_pdt-ud-dev.txt \
    > $path/UD_Czech-ACCS/cs_pdt-ud-dev.txt

python3 split_acc.py < $path/UD_Czech-ACC/cs_pdt-ud-test.txt \
    > $path/UD_Czech-ACCS/cs_pdt-ud-test.txt
    
echo "[$(date +'%T')] processing conlls... "

python3 split_acc.py < $path/UD_Czech-ACC/cs_pdt-ud-train.conllu \
    > $path/UD_Czech-ACCS/cs_pdt-ud-train.conllu

python3 split_acc.py < $path/UD_Czech-ACC/cs_pdt-ud-dev.conllu \
    > $path/UD_Czech-ACCS/cs_pdt-ud-dev.conllu

python3 split_acc.py < $path/UD_Czech-ACC/cs_pdt-ud-test.conllu \
    > $path/UD_Czech-ACCS/cs_pdt-ud-test.conllu

echo -e "[$(date +'%T')] DONE!\n"


nr=20
echo '[$(date +'%T')] Making DE'"$nr"'S dataset... '
mkdir $path/UD_Czech-DE"$nr"S

echo "[$(date +'%T')] processing txts... "

python3 split_acc.py < $path/UD_Czech-DE$nr/cs_pdt-ud-train.txt \
    > $path/UD_Czech-DE"$nr"S/cs_pdt-ud-train.txt

python3 split_acc.py < $path/UD_Czech-DE$nr/cs_pdt-ud-dev.txt \
    > $path/UD_Czech-DE"$nr"S/cs_pdt-ud-dev.txt

python3 split_acc.py < $path/UD_Czech-DE$nr/cs_pdt-ud-test.txt \
    > $path/UD_Czech-DE"$nr"S/cs_pdt-ud-test.txt
    
echo "[$(date +'%T')] processing conlls... "

python3 split_acc.py < $path/UD_Czech-DE$nr/cs_pdt-ud-train.conllu \
    > $path/UD_Czech-DE"$nr"S/cs_pdt-ud-train.conllu

python3 split_acc.py < $path/UD_Czech-DE$nr/cs_pdt-ud-dev.conllu \
    > $path/UD_Czech-DE"$nr"S/cs_pdt-ud-dev.conllu

python3 split_acc.py < $path/UD_Czech-DE$nr/cs_pdt-ud-test.conllu \
    > $path/UD_Czech-DE"$nr"S/cs_pdt-ud-test.conllu

echo -e "[$(date +'%T')] DONE!\n"

