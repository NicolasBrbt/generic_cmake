# Générateur de `CMakeLists.txt`

## Description

Ce projet est un générateur de fichiers `CMakeLists.txt` conçu pour automatiser la création des fichiers de configuration CMake en fonction des composants définis dans un fichier `CmakeComponents.txt`. Il simplifie la gestion des dépendances et des composants de votre projet en générant des configurations adaptées à vos besoins.

## Structure du Projet

Le projet utilise les fichiers suivants :

- **`CmakeComponents.txt`** : Ce fichier est utilisé pour définir les composants du projet et leurs dépendances.
- **`CMakeLists.txt`** : Le fichier de génération automatique.

### Format de `CmakeComponents.txt`

Le fichier `CmakeComponents.txt` doit contenir des instructions `set` pour définir les composants et leurs dépendances. Voici un exemple de contenu :

```cmake
set(CLEAR_MODE "OFF") # Suppression des fichiers temporaires
set(PRINT "ON") # Affichage des informations sur chaque composant (SOURCES, HEADERS, DEPS)

set(BSC_main "main") # Declaration du composant BSC_main
set(BSC_Test "Test") # Declaration du composant BSC_Test

set(BSC_main_DEPS BSC_Test) # Declaration des dependances du composant BSC_main
set(BSC_Test_DEPS "") # Declaration des dependances du composant BSC_Test (aucune dependance)

set(APPCPP BSC_main) # Declaration des applications C++
set(APPC ) # Declaration des applications C
set(LIBC ) # Declaration des librairies C
set(LIBCPP BSC_Test) # Declaration des librairies C++
set(DYNLIB ) # Declaration des librairies dynamiques
```

Il suffit donc de mofiier ce fichier pour ajouter ou supprimer des composants, des dépendances ou des applications.

## Utilisation
Larborescence du projet de votre projet doit respecter la structure suivante : 
    
    ```
    Projet
    ├── CMakeLists.txt (A ne pas modifier)
    ├── CmakeComponents.txt (A modifier)
    ├── README.md
    │
    ├── Composant1
    │   ├── src/
    │   │   ├── main.cpp
    │   │   ├── ...
    │   ├── include/
    │   │   ├── Composant1.h
    │   │   ├── ...
    │   ├── CMakeLists.txt (Généré automatiquement) 
    │
    ├── Composant2
    │   ├── src/
    │   │   ├── ...
    │   ├── include/
    │   │   ├── Composant2.h
    │   │   ├── ...
    │   ├── CMakeLists.txt (Généré automatiquement)
    │
    ├── build-mingw-x64-debug.bat (Script de compilation pour MinGW)
    ├── build-Unix-x64-debug.bat (Script de compilation pour Unix)
    ├── build-Visual-Studio-x64-debug.bat (Script de compilation pour Visual Studio)
    │
    ├── launch-mingw-x64-debug.bat (Scritp de lancement pour MinGW (application a specifier dans le script))
    ├── launch-Unix-x64-debug.bat (Scritp de lancement pour Unix (application a specifier dans le script))
    ├── launch-Visual-Studio-x64-debug.bat (Scritp de lancement pour Visual Studio (application a specifier dans le script))
    ```
Les scripts de compilations fournis genererons un dossier dans le repertoire precedent du projet avec le meme nom que le dossier du projet avec le suffixe du nom du script (ex: build-mingw-x64-debug.bat generera un dossier build-mingw-x64-debug). Les scripts de lancement lancerons l'application specifiee en argument.
Les cmakeLists.txt generes sont a ne pas modifier, ils sont generes automatiquement a partir du fichier CmakeComponents.txt et ce pour chaque composant du projet.

### Compilation
La structure du resultat de la compilation regroupe 3 dossiers :
```
    build/
    ├── bin/ (Dossier contenant les executables)
    ├── lib/ (Dossier contenant les librairies statiques et dynamiques)
    ├── include/ (Dossier contenant tous les headers)
```
D'autres fichiers et dossier peuvent etre presents dans le dossier build, ils sont generes automatiquement par CMake.

Pour un suivi de la compilation, il est possible d'activer l'affichage des informations sur chaque composant en modifiant la variable `PRINT` dans le fichier `CmakeComponents.txt`.


## Exemple
```bash
$ ./build-Unix-x64-debug.bat
$ ./launch-Unix-x64-debug.bat
```

## Auteur
Nicolas-Théo BARBUT
    