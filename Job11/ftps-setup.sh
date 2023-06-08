#! /usr/bin/bash

yes | apt-get update && apt-get upgrade

echo -e "kalimac\nkalimac\nmerry\n\n\n\n\n" | adduser --shell /bin/false --home /home/merry merry
echo -e "secondbreakfast\nsecondbreakfast\npippin\n\n\n\n\n" | adduser --shell /bin/false --home /home/pippin pippin

addgroup ftpgroup

adduser merry ftpgroup
adduser pippin ftpgroup

yes | apt-get install proftpd-*

mkdir -p /etc/proftpd/bckup

mv /etc/proftpd/proftpd.conf /etc/proftpd/bckup
mv /etc/proftpd/tls.conf /etc/proftpd/bckup
mv /etc/proftpd/modules.conf /etc/proftpd/bckup

mkdir -p /etc/proftpd/ssl

echo -e "FR\nFrance\nMarseille\nLaPlateforme\nCyber\nMat\nmatatlaplateforme.io\n" | openssl req -new -x509 -keyout /etc/proftpd/ssl/proftpd.key.pem -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem

cp config-files/proftpd.conf /etc/proftpd
cp config-files/tls.conf /etc/proftpd/tls.conf
cp config-files/modules.conf /etc/proftpd/modules.conf

systemctl restart proftpd


