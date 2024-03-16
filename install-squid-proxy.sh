# https://www.digitalocean.com/community/tutorials/how-to-set-up-squid-proxy-on-ubuntu-20-04
sudo apt update
sudo apt install squid
systemctl status squid.service
# squid.conf is in /etc/squid/squid.conf