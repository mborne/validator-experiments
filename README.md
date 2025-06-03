# validator-experiments

Expérimentations avec [IGNF/validator](https://github.com/IGNF/validator) ayant principalement pour objectif de vérifier sa robustesse sur des jeux de données autres que ceux du [GpU](https://www.geoportail-urbanisme.gouv.fr).

## Pré-requis

* [java et ogr2ogr](https://github.com/IGNF/validator?tab=readme-ov-file#d%C3%A9pendances)
* [ign-validator_4.4.8_all.deb](https://github.com/IGNF/validator/releases/download/v4.4.8/ign-validator_4.4.8_all.deb) (`VALIDATOR_PATH=/opt/ign-validator/validator-cli.jar` par défaut)

## Utilitaires

* [validate.sh {DOCUMENT_ID} {STANDARD} {SRS}](validate.sh) :
    * Télécharge les données dans `documents/{DOCUMENT_ID}/input` à l'aide de `documents/{DOCUMENT_ID}/download.sh`
    * Lance la validation de `documents/{DOCUMENT_ID}/input` avec la configuration `config/{STANDARD}` en appelant `validator-cli.jar`
* [validate-all.sh](validate-all.sh)

## Utilisation

### cadastre_25

Téléchargement et validation des [données cadastre-etalab sur le département 25](https://cadastre.data.gouv.fr/data/etalab-cadastre/latest/shp/departements/25/)

```bash
bash validate.sh cadastre_25 cadastre-etalab EPSG:2154
```

Rapport : [documents/cadastre_25/validation/validation.jsonl](documents/cadastre_25/validation/validation.jsonl)

### route500

Téléchargement et validation des [données ROUTE500](https://files.opendatarchives.fr/professionnels.ign.fr/route500/) :

```bash
bash validate.sh route500 route500 EPSG:2154
```

Rapport : [documents/route500/validation/validation.jsonl](documents/cadastre_25/validation/validation.jsonl)
