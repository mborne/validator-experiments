#!/bin/bash

if [ -e input ];
then
    echo "input already exists"
    exit
fi

mkdir -p input
cd input

CODE_DEP=25
for LAYERNAME in batiments communes feuilles lieux_dits parcelles prefixes_sections subdivisions_fiscales;
do
    ZIPNAME=cadastre-${CODE_DEP}-${LAYERNAME}-shp.zip
    wget -nc https://cadastre.data.gouv.fr/data/etalab-cadastre/latest/shp/departements/${CODE_DEP}/${ZIPNAME}
    unzip -o $ZIPNAME
done

rm *.zip


