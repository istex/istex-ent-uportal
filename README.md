# istex-ent-uportal

Module uPortal ayant pour vocation de permettre l'intégration des ressources ISTEX dans un ENT uPortal

## Installation

### Configuration la portlet CMS

Adapter le fichier *esup-istex.portlet-definition.xml (pour les versions 4)* ou *esup-istex.channel (pour les versions 3)* pour y préciser le/les groupes autorisés à accéder à l'outil et la/les catégories dans la/lesquelles on va trouver le service

### Personnalisation du contenu et configuration des Widgets

Toujours dans le fichier *esup-istex.portlet-definition.xml* ou *esup-istex.channel*, cela se situe dans la balise *value* de la préférence nommée *content*

    <portlet-preference>
        <name>content</name>
        <readOnly>false</readOnly>
        <value> **ICI** </value>

Ici, se situe le codde HTML/javascript qu'affichera la portlet. 

Vous pouvez d'une part personnaliser les textes, la mise en page etc. On encodera alors les signes < et > des balises par `&lt;` et `&gt;`. (Voir l'exemple)

Vous pouvez également configurer les widgets grâce à la variable javascript *istexConfig*

```javascript
    var istexConfig = {
        // l'adresse de l'API de l'Istex
        istexApi: 'https://api.istex.fr'
    };
```

Par exemple, si on souhaite changer le nombre de résultats par page (par défaut : 10) et le nombre maximum de pages à afficher (par défaut : 10) on écrira:
    
```javascript
    var istexConfig = {
        // l'adresse de l'API de l'Istex
        istexApi: 'https://api.istex.fr',
        pageSize: 30,
        maxPagesInPagination: 5
    };
```

Ou encore, si on souhaite configurer les liens d'accès au plein texte par un proxy (ezProy)
    
```javascript
    var istexConfig = {
        // l'adresse de l'API de l'Istex
        istexApi: 'https://api.istex.fr',
        proxyApi: 'https://api-istex-fr.votre-ezproxy.univ.fr',&#xD;			  
    };
```

Voir les [Paramètres des widgets](https://github.com/istex/istex-widgets-angular#param%C3%A8tres-des-widgets)

Pour des raisons de simplicité, les fichiers CSS et JS nécessaires à ce canal sont utilisés comme des ressources externes (en ligne).
Si vous souhaitez les mettre dans votre ENT et ne pas créer une dépendance avec des sites extérieurs (github et CDN) 
vous devez telécharger les fichiers suivants, les mettre sur votre ENT et enfin modifier la publication du canal pour donner leur nouveau chemin d'accès (sur votre ENT) : 
 * https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css
 * https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css
 * https://raw.githubusercontent.com/istex/istex-widgets-angular/master/public/slider/rzslider.css
 * https://raw.githubusercontent.com/istex/istex-widgets-angular/master/css/istexauth.css
 * https://raw.githubusercontent.com/istex/istex-widgets-angular/master/css/istexfacets.css
 * https://raw.githubusercontent.com/istex/istex-widgets-angular/master/css/istexresults.css
 * https://raw.githubusercontent.com/istex/istex-widgets-angular/master/css/istexsearch.css
 * https://raw.githubusercontent.com/istex/istex-widgets-angular/master/css/istexportal.css
 * https://ajax.googleapis.com/ajax/libs/angularjs/1.5.2/angular.min.js
 * https://raw.githubusercontent.com/istex/istex-widgets-angular/master/public/slider/rzslider.js
 * https://raw.githubusercontent.com/istex/istex-widgets-angular/master/app/app.js
 * https://raw.githubusercontent.com/istex/istex-ent-uportal/master/info.js
			
### Déploiement de la portlet dans l'ENT v4

#### Publication de la portlet

Publier la portlet CMS esup-istex.portlet-definition.xml

[ligne de commande]

--> `ant -f $ESUP_HOMEDIR/build.xml data-import -Dfile=$ESUP_HOMEDIR/uportal-war/src/main/data/VOTRE_UNIV_entities/portlet-definition/esup-istex.portlet-definition.xml`

** Logs **

    [...]
    [java]  INFO [03:36,370] Importing Data from: /home/uportal/up-4/src/esup-uportal/uportal-war/src/main/data/ul_entities/portlet-definition/esup-istex.portlet-definition.xml
    [...]
    [java]  INFO [03:38,436] Imported : file:/home/uportal/up-4/src/esup-uportal/uportal-war/src/main/data/ul_entities/portlet-definition/esup-istex.portlet-definition.xml
    [...]

#### Publication de l'onglet

Ajouter la portlet dans l'onglet souhaité

Exemple dans *bu-lo.fragment-layout.xml* :

`<channel fname="esup-istex" unremovable="true" hidden="false" immutable="true" ID="n12"/>`

Importer ou ré-importer l'onglet

[ligne de commande]

--> `ant -f $ESUP_HOMEDIR/build.xml data-import -Dfile=$ESUP_HOMEDIR/uportal-war/src/main/data/VOTRE_UNIV_entities/fragment-layout/bu-lo.fragment-layout.xml`

** Logs **

    [...]
    [java]  INFO [00:41,955] Importing Data from: /home/uportal/up-4/src/esup-uportal/uportal-war/src/main/data/ul_entities/fragment-layout/bu-lo.fragment-layout.xml
    [...]
    [java]  INFO [00:44,306] Imported : file:/home/uportal/up-4/src/esup-uportal/uportal-war/src/main/data/ul_entities/fragment-layout/bu-lo.fragment-layout.xml
    [...]

### Déploiement de la portlet dans l'ENT v3

#### Publication de la portlet


[ligne de commande]

--> `ant db.import -Ddir=VOTRE_DOSSIER_DE_STOCKAGE_channels -Dpattern="esup-istex.channel"`

#### Publication de l'onglet

Ajouter la portlet dans l'onglet souhaité

Exemple dans *bu-lo.fragment-layout* :

`<channel unremovable="" immutable="" hidden="" fname="esup-istex"/>`

Importer ou ré-importer l'onglet

[ligne de commande]

--> `ant db.import -Ddir=VOTRE_DOSSIER_DE_STOCKAGE_fragment-layout -Dpattern="bu-lo.fragment-layout"`

