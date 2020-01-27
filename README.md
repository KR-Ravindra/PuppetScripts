# ** ONE STOP GUIDE TO INSTALL AND CONFIGURE PUPPET **

## Make sure you follow the sequence listed below:

1. Login to your AWS console and Search for EC2

    ![AWS console](images/Puppet1.png)

2. Click on Instances -> Launch Instance -> Ubuntu Server -> Select number of machines (master + slave included)

    ![Creating Instance](images/Puppet2.png)


    ![Creating Instance](images/Puppet3.png)


    ![Creating Instance](images/Puppet4.png)


    ![Creating Instance](images/Puppet5.png)


3. On 6th Step of spinning ubuntu instances,
     add two security groups "All Traffic & All TCP" and set their constraint to "ANYWHERE".

    ![Creating Instance](images/Puppet6.png)


    ![Creating Instance](images/Puppet7.png)

4. Finish, Launch and Procced.

### First open slave machines and run the following:
```
git clone https://github.com/KR-Ravindra/PuppetScripts.git
cd PuppetScripts
chmod +x slave.sh
sudo ./slave.sh

```
![SSH SLAVE](images/Puppet9.png)
Ad master machine IP adress when prompted.

### Now open the master machine and run the following:

```
https://github.com/KR-Ravindra/PuppetScripts.git
cd PuppetScripts
chmod +x master.sh
sudo ./master.sh

```

![SSH MASTER](images/Puppet10.png)

![SSH MASTER](images/Puppet11.png)

Add Slave machines when prompted

### On slave machine run 

```
sudo puppet agent --test
```
![SSH SLAVE](images/Puppet12.png)

Copy the slave machine IP address and check the nginx server deployed. (If default manifesto is used).
![TEST](images/Puppet13.png)

## You will be successfully working with puppet. Reward me a star :shipit:
