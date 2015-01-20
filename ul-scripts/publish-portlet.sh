#!/bin/sh

HOMEDIR=/home/uportal/up-4
. $HOMEDIR/env.sh

file=ul-cms-istex.portlet-definition.xml

echo -e "\n~~~ Copie fichier de publication $file dans src/esup-uportal/uportal-war/src/main/data/ul_entities/portlet-definition ~~~ \n\n"

cp $file  $HOMEDIR/src/esup-uportal/uportal-war/src/main/data/ul_entities/portlet-definition/.

echo -e "\n~~~ Publication de $file dans l'ENT ~~~ \n\n"

$HOMEDIR/ant.sh -f $HOMEDIR/src/esup-uportal/build.xml data-import -Dfile=$HOMEDIR/src/esup-uportal/uportal-war/src/main/data/ul_entities/portlet-definition/$file


