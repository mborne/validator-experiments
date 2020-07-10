#!/bin/bash

#-------------------------------------------------------
# Valide un document
#-------------------------------------------------------
if [ -z "$1" ] || [ -z "$2" ]|| [ -z "$3" ];
then
	echo "validate.sh <DOCUMENT_ID> <STANDARD> <SRS>"
    exit 1
fi
DOCUMENT_ID=$1
STANDARD=$2
SRS=$3

# calcul des chemins des sorties
ROOT_DIR=$(dirname "$(readlink -f "$0")")
DOCUMENTS_DIR=$ROOT_DIR/documents
DOCUMENT_DIR=${DOCUMENTS_DIR}/${DOCUMENT_ID}

VALIDATOR_PATH=${VALIDATOR_PATH:-/opt/ign-validator/validator-cli.jar}

cd $DOCUMENT_DIR

#---------------------------------------------------------------------
# Téléchargement des données
#---------------------------------------------------------------------
bash download.sh

#---------------------------------------------------------------------
# Calcul chemin vers document
#---------------------------------------------------------------------
DOCUMENT_PATH=$DOCUMENT_DIR/input

#---------------------------------------------------------------------
# Lancement de la validation
#---------------------------------------------------------------------
rm -rf validation
java -Xms128m -Xmx256m -jar "$VALIDATOR_PATH" document_validator \
    --report-format jsonl \
    --model file://$ROOT_DIR/config/${STANDARD}/document.json \
    --string-fix-utf8 --string-escape-controls \
    --input $DOCUMENT_PATH \
    --srs "${SRS}" \
    --encoding UTF-8

