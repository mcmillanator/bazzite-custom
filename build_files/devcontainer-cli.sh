rm /usr/local /root
npm install -g @devcontainers/cli
mv /usr/local/* /var/usrlocal/
mv /root/* /var/roothome/
ln -s /var/usrlocal /usr/local
ln -s /var/roothome /root
