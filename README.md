# istex-ent-uportal

Module uPortal ayant comme vocation de permettre l'intégration des ressources ISTEX dans un ENT uPortal

## Installation

### la portlet CMS

Adapter le fichier *istex.portlet-definition.xml* pour y préciser le/les groupes autorisés à accéder à l'outil et la/les catégories dans la/lesquelles on va trouver le service

Publier la portlet CMS istex.portlet-definition.xml

[ligne de commande]

--> `$HOMEDIR/ant.sh -f $HOMEDIR/src/esup-uportal/build.xml data-import -Dfile=$HOMEDIR/src/esup-uportal/uportal-war/src/main/data/ul_entities/portlet-definition/istex.portlet-definition.xml`

** Logs **

    [...]
    [java]  INFO [03:36,370] Importing Data from: /home/uportal/up-4/src/esup-uportal/uportal-war/src/main/data/ul_entities/portlet-definition/istex.portlet-definition.xml
    [...]
    [java]  INFO [03:38,436] Imported : file:/home/uportal/up-4/src/esup-uportal/uportal-war/src/main/data/ul_entities/portlet-definition/istex.portlet-definition.xml
    [...]

### l'onglet

Ajouter la portlet dans l'onglet souhaité

Exemple dans *bu-lo.fragment-layout.xml* :

`<channel fname="istex" unremovable="true" hidden="false" immutable="true" ID="n12"/>`

Importer ou ré-importer l'onglet

[ligne de commande]

--> `$HOMEDIR/ant.sh -f $HOMEDIR/src/esup-uportal/build.xml data-import -Dfile=$HOMEDIR/src/esup-uportal/uportal-war/src/main/data/ul_entities/fragment-layout/bu-lo.fragment-layout.xml`

** Logs **

    [...]
    [java]  INFO [00:41,955] Importing Data from: /home/uportal/up-4/src/esup-uportal/uportal-war/src/main/data/ul_entities/fragment-layout/bu-lo.fragment-layout.xml
    [...]
    [java]  INFO [00:44,306] Imported : file:/home/uportal/up-4/src/esup-uportal/uportal-war/src/main/data/ul_entities/fragment-layout/bu-lo.fragment-layout.xml
    [...]

Vous trouverez dans ul_scripts l'exemple de déploiement dans l'ENT de l'Université de Lorraine :

* publish-portlet.sh : Publication de la portlet
* publish-fragment.sh : Publication de l'onglet
* publish.sh : Publication de la portlet puis de l'onglet
