#!/bin/bash

# Afiseaza cererea de introducere a datelor.

read -p "Numele dumneavoastra de utilizator:" homeuser ;

echo "Introduceti datele de conectare pentru dispozitivul dorit.";

read -p "Adresa IP a dispozitivului:" ipvar;

read -p "Nume utilizator:" uservar;

read -sp "Parola utilizator:" passvar;

echo "";

echo "Se incearca conectarea..";

sshpass -p $passvar ssh $uservar@$ipvar <<EOF

export TERM=xterm ;

echo $passvar | sudo -S apt-get -y install htop ;

echo $passvar | sudo -S apt-get install aha ;

echo -q | htop | aha --black --line-fix > /home/$uservar/Desktop/Raport.html;

EOF

sshpass -p $passvar scp $uservar@$ipvar:/home/$uservar/Desktop/Raport.html /home/$homeuser/Desktop ;

echo "Va pregatim raportul.." ;

sleep 2s ;

firefox /home/$homeuser/Desktop/Raport.html ; 
