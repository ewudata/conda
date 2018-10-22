VAGRANTFILE_API_VERSION = "2"

$conda_installation = <<SCRIPT
  sudo systemctl disable firewalld
  sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
  curl https://repo.continuum.io/archive/Anaconda3-5.3.0-Linux-x86_64.sh -o anaconda.sh || exit 1;
  bash anaconda.sh -b || exit 1;
  grep -q anaconda ~/.bashrc;
  if [[ ${?} -ne 0 ]]; then
    echo "export PATH=\"${HOME}/anaconda3/bin:\${PATH}\"" >> ~/.bashrc
  fi
  source ~/.bashrc
  conda info || exit 1;
  rm anaconda.sh || exit 1;
  conda clean -t || exit 1;
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento/centos-7.5"
  config.vm.hostname = "conda"
  config.vm.network "forwarded_port", guest: 8888, host: 8888
  #  config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", :mount_options => ["dmode=777","fmode=777"]
  # config.vm.network "private_network", ip: "192.168.99.100"

  config.vm.provider "virtualbox" do |v|
    v.linked_clone = true
    v.memory = "1024"
    v.cpus = "4"
  end

  yum install epel-release -y
  yum install httpd mod_wsgi -y
  yum install -y https://centos7.iuscommunity.org/ius-release.rpm
  yum install -y python36u python36u-libs python36u-devel python36u-pip
  mkdir /opt/djangoproject
  cd /opt/djangoproject
  virtualenv djangoprojectenv
  source djangoprojectenv/bin/activate
  pip install django
  django-admin --version

  # config.vm.provision "shell", inline: <<-SHELL
  #   # sudo yum -y groupinstall "GNOME Desktop"
  #   # sudo systemctl set-default graphical.target
  #   # sudo systemctl start graphical.target
  # SHELL
  # config.vm.provision "shell", inline: $conda_installation,  privileged: false
  
  # config.vm.provision "shell", run: "always", inline: <<-SHELL
  #   su -c 'jupyter notebook --notebook-dir=/vagrant/notebook --no-browser --ip=0.0.0.0 &' - vagrant
  # SHELL

end
