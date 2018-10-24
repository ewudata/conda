VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento/centos-7.5"
  config.vm.hostname = "conda"
  config.vm.network "private_network", ip: "192.168.99.100"
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.synced_folder ".", "/home/vagrant"

  config.vm.provider "virtualbox" do |v|
    v.linked_clone = true
    v.memory = "1024"
    v.cpus = "4"
  end
  config.vm.provision :shell, :path => "run.sh"

end
