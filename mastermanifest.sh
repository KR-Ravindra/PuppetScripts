sudo mkdir -p /etc/puppet/code/environments/production/manifests
cd /etc/puppet/code/environments/production/manifests
sudo touch site.pp
sudo echo " 
 node default{ 
     package{'nginx':
     ensure => installed,
     }
    file{'/tmp/status.txt':
     content=> "nginx installed",
     mode=> '0644',
     }
    }
" >> site.pp 
