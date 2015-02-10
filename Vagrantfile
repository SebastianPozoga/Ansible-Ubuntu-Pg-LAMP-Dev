
Vagrant.configure(2) do |config|

  #Base VM
  config.vm.box = "ubuntu/trusty64"


  # Network
  config.vm.network "forwarded_port", guest: 80, host: 8080 #Apache
  config.vm.network "forwarded_port", guest: 19001, host: 19001 #xdebug
  config.vm.network "forwarded_port", guest: 3306, host: 13306  #mysql
  config.vm.network "forwarded_port", guest: 5432, host: 15432  #postgres


  # Hardware
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end


  # Ansible
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "playbook.yml"
  end


  # OPTIONAL:
  # Sync folder by vagrant - I use ansible
  config.vm.synced_folder "sources", "/sources"

end
