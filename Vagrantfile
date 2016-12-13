VAGRANTFILE_API_VERSION = "2"

$conda_installation = <<SCRIPT
yum -y install bzip2
curl https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh -o anaconda.sh || exit 1;
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
  config.vm.box = "bento/centos-7.2"
  config.vm.hostname = "conda"
  config.vm.provider "virtualbox" do |v|
    v.linked_clone = true
    v.memory = "2048"
    v.cpus = "2"
    v.gui = true
  end

  config.vm.provision "shell", inline: $conda_installation
end