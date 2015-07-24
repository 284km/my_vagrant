# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "default" do |web|
    # web.vm.box = "ubuntu/vivid64"
    web.vm.box = "ubuntu/vivid32"
    web.vm.boot_timeout = 900
    # web.vm.hostname = "hostname"

    config.vm.provider "virtualbox" do |v|
      # v.memory = 2048
      # v.cpus = 2
      # v.gui = true
    end

    # web.vm.network :forwarded_port, guest:22, host:2001, id:"ssh"
    # web.vm.network :forwarded_port, guest:80, host:8080, id:"http"
    # web.vm.network :forwarded_port, guest: 4000, host: 3000
    # web.vm.synced_folder ".", "/vagrant"
    web.vm.network :private_network, ip: "192.168.50.11"
  end
end
