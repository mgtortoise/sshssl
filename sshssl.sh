apt install stunnel4 -y
wget https://raw.githubusercontent.com/mgtortoise/hellogithub/master/stunnel.conf
wget https://raw.githubusercontent.com/mgtortoise/hellogithub/master/stunnel4
rm -rf /etc/stunnel/stunnel.conf
mv stunnel.conf /etc/stunnel/stunnel.conf
rm -rf /etc/default/stunnel4
mv stunnel4 /etc/default/stunnel4
mkdir ssl_cert
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095
cat key.pem cert.pem>> /etc/stunnel/stunnel.pem
sudo /etc/init.d/stunnel4 restart
