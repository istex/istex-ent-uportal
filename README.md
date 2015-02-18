# istex-ent-uportal

Module uPortal ayant pour vocation de permettre l'intégration des ressources ISTEX dans un ENT uPortal

## Installation

### Configuration la portlet CMS

Adapter le fichier *istex.portlet-definition.xml* pour y préciser le/les groupes autorisés à accéder à l'outil et la/les catégories dans la/lesquelles on va trouver le service

### Personnalisation du contenu et configuration des Widgets

Toujours dans le fichier *istex.portlet-definition.xml*, cela se situe dans la balise *value* de la préférence nommée *content*

    <portlet-preference>
        <name>content</name>
        <readOnly>false</readOnly>
        <value> **ICI** </value

Ici, se situe le codde HTML/javascript qu'affichera la portlet. 

Vous pouvez d'une part personnaliser les textes, la mise en page etc. On encodera alors les signes < et > des balises par `&lt;` et `&gt;`. (Voir l'exemple)

Vous pouvez également configurer les widgets grâce à la variable javascript *istexConfig*

```javascript
    var istexConfig = {
        // l'adresse de l'API de l'Istex
        istexApi: 'https://api.istex.fr'
    };
```

Par exemple, si on souhaite chager le nombre de résultats par page (par défaut : 10) et le nombre maximum de pages à afficher (par défaut : 10) on écrira:
    
```javascript
    var istexConfig = {
        // l'adresse de l'API de l'Istex
        istexApi: 'https://api.istex.fr',
        pageSize: 30,
        maxPagesInPagination: 5
    };
```

Voir les [Paramètres des widgets](https://github.com/istex/istex-widgets#param%C3%A8tres-des-widgets)


### Déploiement de la portlet dans l'ENT

#### Publication de la portlet

Publier la portlet CMS istex.portlet-definition.xml

[ligne de commande]

--> `ant -f $ESUP_HOMEDIR/build.xml data-import -Dfile=$ESUP_HOMEDIR/uportal-war/src/main/data/VOTRE_UNIV_entities/portlet-definition/istex.portlet-definition.xml`

** Logs **

    [...]
    [java]  INFO [03:36,370] Importing Data from: /home/uportal/up-4/src/esup-uportal/uportal-war/src/main/data/ul_entities/portlet-definition/istex.portlet-definition.xml
    [...]
    [java]  INFO [03:38,436] Imported : file:/home/uportal/up-4/src/esup-uportal/uportal-war/src/main/data/ul_entities/portlet-definition/istex.portlet-definition.xml
    [...]

#### Publication de l'onglet

Ajouter la portlet dans l'onglet souhaité

Exemple dans *bu-lo.fragment-layout.xml* :

`<channel fname="istex" unremovable="true" hidden="false" immutable="true" ID="n12"/>`

Importer ou ré-importer l'onglet

[ligne de commande]

--> `ant -f $ESUP_HOMEDIR/build.xml data-import -Dfile=$ESUP_HOMEDIR/uportal-war/src/main/data/VOTRE_UNIV_entities/fragment-layout/bu-lo.fragment-layout.xml`

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
