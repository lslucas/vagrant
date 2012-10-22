# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "lucid32"
  #config.vm.box = "precise32"
  # config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  # config.vm.boot_mode = :gui
  config.vm.network :hostonly, "192.168.33.10"
  #config.vm.network :bridged
  config.vm.forward_port 80, 80
  config.vm.forward_port 22, 2222
  config.vm.forward_port 3306, 3306
  config.vm.forward_port 27017, 27017 #mongo
  config.vm.forward_port 27107, 27107 #mongo
  # config.vm.share_folder "v-data", "/vagrant_data", "../data"
  config.ssh.max_tries = 60
  config.ssh.timeout = 30
  config.vm.provision :shell, :inline => "echo \"America/Sao_Paulo\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"
  config.vm.share_folder "Sites", "/var/www", "~/Sites"
  # Update the server
  #config.vm.provision :shell, :inline => "apt-get update --fix-missing"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.data_bags_path = "databags"
    chef.add_recipe("vagrant_main")

    #chef.log_level = :debug
    chef.json = {
      :mysql => {
        :server_root_password => ""
      },
      :apache => {
        :user => "vagrant"
      }
    }
  end

end
