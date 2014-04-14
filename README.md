willy
=====

Install vagrant: http://www.vagrantup.com/downloads

$ gem install berkshelf
$ vagrant plugin install vagrant-berkshelf --plugin-version 2.0.0.rc3

$ vagrant up
$ vagrant ssh
$ exit
$ vagrant destroy


## Provision only chef stuff

$ vagrant provision --provision-with chef