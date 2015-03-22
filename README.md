# vagrant-provision

**V1.0.0**


#### Testing:
```
make test           // launch vagrant and to test
make halt           // the same as "vagrant halt"
make up             // the same as "vagrant up"
make ssh            // the same as "vagrant ssh"
make clean          // destroy vm and rm test folder
```

#### Example:
`git clone git@github.com:joaquimserafim/vagrantfile-template.git ´name_my_vm´`

edit the Vangrantfile and make the changes you want for example:

* port forwarded => *config.vm.network :forwarded_port, guest: 3000, host: 3000*
* vm ip address => *config.vm.network :private_network, ip: "192.168.33.10"*
* vm shared folder => *config.vm.synced_folder "~", "/vagrant"*
* vm name => *vb.name = "vagrant-template"*
* vm memory => *"--memory", "512"*


and finally set the provision:

**config.vm.provision "shell", path: "https://raw.githubusercontent.com/joaquimserafim/vagrant-provision/master/provision.sh", args: ""**

an example for `args` => "htop git node.js mongodb"


