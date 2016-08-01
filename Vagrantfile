# -*- mode: ruby -*-
# vi: set ft=ruby :

# 1. Use provided Vagrantfile_windows file to construct a VirtualBox VM.
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu14-cloudimage"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # Your implementation goes here
  
  # Here starts my implementation
  # The goal is to implement following
  # 1. Use provided Vagrantfile_windows file to construct a VirtualBox VM.
  # 2. Enable the VMs basic config, networking and file sharing
  # 3. Modify the Vagrantfile to install a web app of your choice(tried apache2 and nginx)
  # 4. Modify the Vagrantfile to configure the web app and OS.
  # 5. Create a script that queries checkip.dyndns.org, and appends the output to a file according to required format.
  # 6. Create a text document that explains how your script
  
  # 2. Enable the VMs basic config, networking and file sharing
  config.vm.hostname = "puppet"
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "55.55.55.5"
  
  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
   config.vm.synced_folder "./script", "/vagrant_script"

  # 3. Modify the Vagrantfile to install a web app of your choice(tried apache2 and nginx)
  # we can also write vagrant_provision.sh separately
    config.vm.provision "shell", inline: <<-SHELL
       sudo apt-get update
       sudo apt-get install -y apache2
	#  sudo apt-get install -y nginx  # you can do nginx the same way
	#  sudo service nginx start
    SHELL
  
  # 4. Modify the Vagrantfile to configure the web app and OS.
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50", "--cpus", "1"]
	vb.memory = 1024
  end

  # 5. Create a script that queries checkip.dyndns.org, and appends the output to a file according to required format.
  # the script is: queryOutputFormat.sh 
  config.vm.provision "shell", path:"queryOutputFormat.sh"

  # 6. Create a text document that explains how your script
  # Please see Instruction.txt
end
