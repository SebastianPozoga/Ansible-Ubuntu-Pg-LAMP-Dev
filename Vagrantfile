
Vagrant.configure(2) do |config|

  #Base VM
  config.vm.box = "ubuntu/trusty64"


  # Network
  config.vm.network "forwarded_port", guest: 80, host: 8080 #Apache
  config.vm.network "forwarded_port", guest: 19000, host: 19000 #xdebug
  config.vm.network "forwarded_port", guest: 3306, host: 13306  #mysql
  config.vm.network "forwarded_port", guest: 5432, host: 15432  #postgres

  config.vm.synced_folder "files/var/www/html/", "/var/www/html", type: "rsync", :owner => "www-data:www-data", :mount_options => [ "dmode=775", "fmode=774" ]

  config.vm.synced_folder "files/var/www/html/", "/var/www/html", type: "rsync",
        :owner => "www-data:www-data",
        :mount_options => [ "dmode=775", "fmode=774" ],
        rsync__exclude: ".git/",
        rsync__args: ["--verbose", "--rsync-path='sudo rsync'", "--archive", "--delete", "-z"]


  # Hardware
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "4"]
  end

  # Share files
  Vagrant.configure('2') do |config|

  end


  # Ansible
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "playbook.yml"
  end

end
