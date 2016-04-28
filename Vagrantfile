# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true

    # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end

  config.vm.network "private_network", ip: "192.168.43.10"
  config.vm.synced_folder "~/dev", "/codebases"
  config.vm.hostname = "sand-box"

  config.vm.provision "shell", path: "provision.sh"

end
