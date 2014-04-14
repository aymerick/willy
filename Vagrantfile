# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Basic VM configuration
  config.vm.box = "hashicorp/precise64"
  config.vm.hostname = "willy"
  config.vm.network "forwarded_port", guest: 80, host: 4444

  # Enable berkshelf to fetch and setup chef cookbooks automagically
  config.berkshelf.enabled = true

  # Shell provisioner
  config.vm.provision :shell, :path => '.vagrant_setup.sh'

  # Chef provisioner
  config.vm.provision "chef_solo" do |chef|
    chef.json = {
      "rvm" => {
        'rubies' => [ "ruby-1.9.3-p545", "ruby-2.1.0" ],
        'default_ruby' => "ruby-1.9.3-p545",
        'gems' => {
          'ruby-2.1.0' => [
            { 'name' => 'bundler' },
            { 'name' => 'rails' }
          ]
        }
      }
    }

    chef.add_recipe "apt"

    chef.add_recipe "mongodb::10gen_repo"
    chef.add_recipe "mongodb::default"

    chef.add_recipe "rvm::vagrant"
    chef.add_recipe "rvm::system"
  end

end
