#!/bin/bash

if [ -e input ];
then
    echo "input already exists"
    exit
fi

mkdir -p archive
wget -nc -O archive/ROUTE500.7z https://files.opendatarchives.fr/professionnels.ign.fr/route500/ROUTE500_3-0__SHP_LAMB93_FXX_2019-10-30.7z

rm -rf ROUTE500*
7z x archive/ROUTE500.7z

mv ROUTE500_3-0__SHP_LAMB93_FXX_2019-10-30/ROUTE500/1_DONNEES_LIVRAISON_2019-11-00280/R500_3-0_SHP_LAMB93_FXX-ED191 input
rm -rf ROUTE500_3-0__*

