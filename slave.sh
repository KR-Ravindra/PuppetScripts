#!/bin/bash
packages="wget figlet boxes pv"
Initialiser()
{
    clear
        sudo apt-get update
    clear
        echo "Installing requested packages" | pv -qL 10
    sleep 1s
        sudo apt-get install $packages -y
    clear
        figlet -c -t -k Welcome
        echo "Downloading and Installing puppet" | pv -qL 10
        wget https://apt.puppetlabs.com/puppet-release-bionic.deb
    sleep 1s
        sudo dpkg -i puppet-release-bionic.deb
        sudo apt-get install puppet -y
        apt policy puppet
        sudo rm -rf *.deb.* *.deb
        sudo systemctl restart puppet.service
    clear
        echo "Installed puppet services " | pv -qL 10
    sleep 1s
        echo "Allowing port 8140 TCP" | pv -qL 10
    sleep 1s
        sudo ufw allow 8140/tcp
    echo "
    
    "
}
Initialiser

writeHosts(){
    figlet -t -c -k "Add  master  machine".
    
        read -p "Enter IP address of master : " ipvalue
        sudo echo "$ipvalue puppet" >> /etc/hosts
 
    echo "Writing hosts" | pv -qL 10
    sleep 1s
}
writeHosts
echo "

"
figlet -c -t -k END
sleep 1s
echo "

"
echo "Support by starring this repo at https://github.com/KR-Ravindra/PuppetScripts.git" | boxes

