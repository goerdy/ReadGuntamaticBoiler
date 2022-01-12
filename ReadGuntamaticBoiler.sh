#!/bin/bash

######### Boiler Data #########
IP="XX.XX.XX.XX"
KEY="1234..36"
###############################

wget -O daqdesc.csv http://$IP/daqdesc.cgi?key=$KEY
wget -O daqdata.csv http://$IP/daqdata.cgi?key=$KEY
paste -d ';' daqdesc.csv daqdata.csv > guntamatic.csv
sed -i '/reserved/d' guntamatic.csv
sed -i '1s/.*$/Bezeichnung;Einheit;Wert\n&/g' guntamatic.csv
mv guntamatic.csv /home/iobroker/guntamatic.csv
