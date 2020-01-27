sudo apt-get update
sudo apt-get install wget
wget https://apt.puppetlabs.com/puppet-release-bionic.deb
sudo dpkg -i puppet-release-bionic.deb
sudo apt-get install puppet
apt policy puppet
#sudo systemctl status puppet.service
sudo systemctl restart puppet.service
sudo ufw allow 8140/tcp
sudo echo "$0 puppet" >> /etc/hosts
