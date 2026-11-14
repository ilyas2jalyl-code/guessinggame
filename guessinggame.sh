#!/bin/bash
# guessinggame.sh : devinez le nombre de fichiers du répertoire actuel

# Fonction qui compte les fichiers du répertoire actuel
count_files() {
    ls | wc -l
}

# Fonction qui vérifie que la saisie est un nombre entier
is_number() {
    [[ $1 =~ ^[0-9]+$ ]]
}

nb_files=$(count_files)
found=false

echo "Bienvenue dans le jeu de devinettes !"
echo "Combien de fichiers y a-t-il dans le répertoire actuel ?"

while [[ $found == false ]]
do
    read -p "Entrez votre estimation : " response

    if ! is_number "$response"
    then
        echo "Veuillez entrer un nombre entier valide."
    elif [[ $response -lt $nb_files ]]
    then
        echo "Trop bas ! Essayez encore."
    elif [[ $response -gt $nb_files ]]
    then
        echo "Trop haut ! Essayez encore."
    else
        found=true
    fi
done

echo "Félicitations ! Vous avez trouvé : il y a $nb_files fichiers."