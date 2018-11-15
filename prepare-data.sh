#!/bin/bash

srcpath=$1
path=$2

echo "Making ACC dataset... "
mkdir $path/UD_Czech-ACC

echo "catting conlls... "

#cat $srcpath/UD_Czech-PDT/cs_pdt-ud-train-c.conllu \
#    $srcpath/UD_Czech-PDT/cs_pdt-ud-train-l.conllu \
#    $srcpath/UD_Czech-PDT/cs_pdt-ud-train-m.conllu \
#    $srcpath/UD_Czech-PDT/cs_pdt-ud-train-v.conllu \
#    > $path/UD_Czech-ACC/cs_pdt-ud-train.connlu

cp $srcpath/UD_Czech-PDT/cs_pdt-ud-train.conllu $path/UD_Czech-ACC/

cp $srcpath/UD_Czech-PDT/cs_pdt-ud-dev.conllu $path/UD_Czech-ACC/

cp $srcpath/UD_Czech-PDT/cs_pdt-ud-test.conllu $path/UD_Czech-ACC/

echo "extracting txts... "

python conll_to_text.py < $srcpath/UD_Czech-PDT/cs_pdt-ud-train.conllu \
    > $path/UD_Czech-ACC/cs_pdt-ud-train.txt
        
python conll_to_text.py < $srcpath/UD_Czech-PDT/cs_pdt-ud-dev.conllu \
    > $path/UD_Czech-ACC/cs_pdt-ud-dev.txt
    
python conll_to_text.py < $srcpath/UD_Czech-PDT/cs_pdt-ud-test.conllu \
    > $path/UD_Czech-ACC/cs_pdt-ud-test.txt

echo -e "DONE!\n"



nr=20
echo "Making DE$nr dataset... "
mkdir $path/UD_Czech-DE$nr

echo "deaccenting txts... "

python deaccent.py -p $nr -n $path/UD_Czech-DE$nr/cs_pdt-ud-train.nr \
    $path/UD_Czech-ACC/cs_pdt-ud-train.txt \
    $path/UD_Czech-DE$nr/cs_pdt-ud-train.txt
    
python deaccent.py -p $nr -n $path/UD_Czech-DE$nr/cs_pdt-ud-dev.nr \
    $path/UD_Czech-ACC/cs_pdt-ud-dev.txt \
    $path/UD_Czech-DE$nr/cs_pdt-ud-dev.txt
    
python deaccent.py -p $nr -n $path/UD_Czech-DE$nr/cs_pdt-ud-test.nr \
    $path/UD_Czech-ACC/cs_pdt-ud-test.txt \
    $path/UD_Czech-DE$nr/cs_pdt-ud-test.txt
    
echo "deaccenting conlls... "

python deaccent.py -c -l $path/UD_Czech-DE$nr/cs_pdt-ud-train.nr \
    $path/UD_Czech-ACC/cs_pdt-ud-train.conllu \
    $path/UD_Czech-DE$nr/cs_pdt-ud-train.conllu
    
python deaccent.py -c -l $path/UD_Czech-DE$nr/cs_pdt-ud-dev.nr \
    $path/UD_Czech-ACC/cs_pdt-ud-dev.conllu \
    $path/UD_Czech-DE$nr/cs_pdt-ud-dev.conllu
    
python deaccent.py -c -l $path/UD_Czech-DE$nr/cs_pdt-ud-test.nr \
    $path/UD_Czech-ACC/cs_pdt-ud-test.conllu \
    $path/UD_Czech-DE$nr/cs_pdt-ud-test.conllu

echo -e "DONE!\n"



nr=100
echo "Making DE$nr dataset... "
mkdir $path/UD_Czech-DE$nr

echo "deaccenting txts... "

python deaccent_all.py < $path/UD_Czech-ACC/cs_pdt-ud-train.txt \
    > $path/UD_Czech-DE$nr/cs_pdt-ud-train.txt

python deaccent_all.py < $path/UD_Czech-ACC/cs_pdt-ud-dev.txt \
    > $path/UD_Czech-DE$nr/cs_pdt-ud-dev.txt

python deaccent_all.py < $path/UD_Czech-ACC/cs_pdt-ud-test.txt \
    > $path/UD_Czech-DE$nr/cs_pdt-ud-test.txt
    
echo "deaccenting conlls... "

python deaccent_all.py < $path/UD_Czech-ACC/cs_pdt-ud-train.conllu \
    > $path/UD_Czech-DE$nr/cs_pdt-ud-train.conllu

python deaccent_all.py < $path/UD_Czech-ACC/cs_pdt-ud-dev.conllu \
    > $path/UD_Czech-DE$nr/cs_pdt-ud-dev.conllu

python deaccent_all.py < $path/UD_Czech-ACC/cs_pdt-ud-test.conllu \
    > $path/UD_Czech-DE$nr/cs_pdt-ud-test.conllu

echo -e "DONE!\n"


#ACCENT SPLITTING
echo "Making ACCS dataset... "
mkdir $path/UD_Czech-ACCS

echo "processing txts... "

python split_acc.py < $path/UD_Czech-ACC/cs_pdt-ud-train.txt \
    > $path/UD_Czech-ACCS/cs_pdt-ud-train.txt

python split_acc.py < $path/UD_Czech-ACC/cs_pdt-ud-dev.txt \
    > $path/UD_Czech-ACCS/cs_pdt-ud-dev.txt

python split_acc.py < $path/UD_Czech-ACC/cs_pdt-ud-test.txt \
    > $path/UD_Czech-ACCS/cs_pdt-ud-test.txt
    
echo "processing conlls... "

python split_acc.py < $path/UD_Czech-ACC/cs_pdt-ud-train.conllu \
    > $path/UD_Czech-ACCS/cs_pdt-ud-train.conllu

python split_acc.py < $path/UD_Czech-ACC/cs_pdt-ud-dev.conllu \
    > $path/UD_Czech-ACCS/cs_pdt-ud-dev.conllu

python split_acc.py < $path/UD_Czech-ACC/cs_pdt-ud-test.conllu \
    > $path/UD_Czech-ACCS/cs_pdt-ud-test.conllu

echo -e "DONE!\n"


nr=20
echo 'Making DE'"$nr"'S dataset... '
mkdir $path/UD_Czech-DE"$nr"S

echo "processing txts... "

python split_acc.py < $path/UD_Czech-DE$nr/cs_pdt-ud-train.txt \
    > $path/UD_Czech-DE"$nr"S/cs_pdt-ud-train.txt

python split_acc.py < $path/UD_Czech-DE$nr/cs_pdt-ud-dev.txt \
    > $path/UD_Czech-DE"$nr"S/cs_pdt-ud-dev.txt

python split_acc.py < $path/UD_Czech-DE$nr/cs_pdt-ud-test.txt \
    > $path/UD_Czech-DE"$nr"S/cs_pdt-ud-test.txt
    
echo "processing conlls... "

python split_acc.py < $path/UD_Czech-DE$nr/cs_pdt-ud-train.conllu \
    > $path/UD_Czech-DE"$nr"S/cs_pdt-ud-train.conllu

python split_acc.py < $path/UD_Czech-DE$nr/cs_pdt-ud-dev.conllu \
    > $path/UD_Czech-DE"$nr"S/cs_pdt-ud-dev.conllu

python split_acc.py < $path/UD_Czech-DE$nr/cs_pdt-ud-test.conllu \
    > $path/UD_Czech-DE"$nr"S/cs_pdt-ud-test.conllu

echo -e "DONE!\n"

