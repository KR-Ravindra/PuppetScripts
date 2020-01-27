#!/bin/bash
packages="wget figlet boxes pv"
Initialiser()
{
    clear
        sudo apt-get update
    clear
        echo "Installing requested packages" 
    sleep 1s
        sudo apt-get install $packages -y
    clear
        figlet -c -t -k Welcome
        echo "Downloading and Installing puppermaster" | pv -qL 10
        wget https://apt.puppetlabs.com/puppet-release-bionic.deb
    sleep 1s
        sudo dpkg -i puppet-release-bionic.deb
        sudo apt-get install puppetmaster -y
        apt policy puppetmaster
        sudo rm -rf *.deb.* *.deb
        sudo systemctl restart puppet-master.service
    clear
        echo "Installed puppet master services " | pv -qL 10
    sleep 1s
        echo "Allowing port 8140 TCP" | pv -qL 10
    sleep 1s
        sudo ufw allow 8140/tcp
    echo "
    
    "
}
Initialiser

writeHosts(){
    figlet -t -c -k "Add  slave  machines".
    read -p "Number of slave machines: " var
    i=1
    while [ $i -le $var ]
    do
        read -p "Enter IP address of $i : " ipvalue
        sudo echo "$ipvalue puppet" >> /etc/hosts
        let i+=1
    done
    echo "Writing hosts" | pv -qL 10
    sleep 1s
}
writeHosts

CertificationSign() {
    sudo systemctl restart puppet-master.service puppet.service
    sudo puppet cert list
    sudo systemctl restart puppet-master.service puppetmaster.service
    sudo systemctl start puppet-master.service puppetmaster.service puppet.service
    sudo puppet cert sign --all
    sleep 3s
    sudo puppet cert list
    sudo puppet cert sign --all
}
CertificationSign

manifestoFile(){
    sudo mkdir -p /etc/puppet/code/environments/production/manifests
    cd /etc/puppet/code/environments/production/manifests
    read -p "Do you want to write proceed with sample manifesto? [Y/N]: " yn
    case $yn in   
    [Nn]*)  
            sudo rm -rf *.pp;
            sudo nano site.pp;;
    [Yy]*)
            sudo echo "#sample nginx server
            node default{ 
            package{'nginx':
            ensure => installed,
            }
            file{'/tmp/status.txt':
            content=> \"nginx installed\",
            mode=> '0644',
            }
            }" > site.pp;
            echo "
            
            "
            cat site.pp | pv -qL 25;;
    *) echo "Please answer yes or no.";;
    esac
    echo "
    Proceed to slave and execute \"sudo puppet agent --test\"" | pv -qL 10
    sleep 2s
}

read -p "Proceed creating manifesto? [Y/N]: " req
case $req in
[Yy]*)  
      manifestoFile;;
[Nn]*)
      ;;      
*) echo "Please answer yes or no.";;
esac

echo "

"
figlet -c -t -k END
sleep 1s
echo "

"
echo "Support by starring this repo at https://github.com/KR-Ravindra/PuppetScripts.git" | boxes
