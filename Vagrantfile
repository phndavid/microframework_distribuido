# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :nodejs_app do |master|
    master.vm.box = "centos_2016"
    master.vm.network :private_network, ip: "192.168.56.174"
    master.vm.network "public_network", :bridge => "eth1", ip:"192.168.131.175", :auto_config => "false", :netmask => "255.255.255.0"
    master.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024","--cpus", "4", "--name", "nodejs_app" ]
    end
      config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      #chef.add_recipe "mirror"
      chef.add_recipe "nodejs"
      #chef.json = {"aptmirror" => {"server" => "192.168.131.253"}}
    end
  end
end