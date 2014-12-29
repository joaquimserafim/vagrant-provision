#vagrant-provision

**V1.0.0**

you can use `npm` to run the test

#####Testing:
    npm test            // launch vagrant and start the provision
    npm run destroy     // the same as "vagrant destroy"
    npm run halt        // the same as "vagrant halt"
    npm run provision   // the same as "vagrant provision"
    npm run ssh         // the same as "vagrant ssh"


#####Example:
    git clone git@github.com:joaquimserafim/vagrantfile-template.git ´name_my_vm´

edit the Vangrantfile and make the changes you want for example:

* port forwarded => *config.vm.network :forwarded_port, guest: 3000, host: 3000*
* vm ip address => *config.vm.network :private_network, ip: "192.168.33.10"*
* vm shared folder => *config.vm.synced_folder "~", "/vagrant"*
* vm name => *vb.name = "vagrant-template"*
* vm memory => *"--memory", "512"*


and finally set the provision:

**config.vm.provision "shell", path: "https://raw.githubusercontent.com/joaquimserafim/vagrant-provision/master/provision.sh", args: ""**

an example for `args` => "htop git node.js mongodb"


