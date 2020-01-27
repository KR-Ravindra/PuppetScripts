sudo apt-get update
sudo apt-get install wget -y
wget https://apt.puppetlabs.com/puppet-release-bionic.deb
sudo dpkg -i puppet-release-bionic.deb
sudo apt-get install puppetmaster -y
#apt policy puppetmaster
#sudo systemctl status puppet-master.service
sudo systemctl restart puppet-master.service
sudo ufw allow 8140/tcp
sudo echo "$0 puppet" >> /etc/hosts
