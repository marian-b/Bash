#!/bin/bash

read -p "Nume utilizator:" uservar;

read -p "Tipul sirului generat (ex.A-Z sau a-z sau 0-9):" tipvar;

read -p "Dimensiunea sirului (ex.5):" dimvar;

read -p "Dimensiunea fisierului generat(ex.1MB):" filevar;

cat /dev/urandom | tr -dc $tipvar | fold -w $dimvar | head -c $filevar > /home/$uservar/Desktop/SiruriRandom.txt

echo "";

echo "Fisier generat!";