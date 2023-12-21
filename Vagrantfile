Vagrant.configure(2) do |config|
  # образ системы Ubuntu 
  config.vm.box = "ubuntu/focal64"
  # не проверять репозиторий на наличие обновлений
  config.vm.box_check_update = false
  # отменить создание ssh-ключа
  # config.ssh.insert_key = false
  # config.ssh.username = 'vagrant'
  # config.ssh.password = 'vagrant'
  hostname_1 = "web01"
  hostname_2 = "db01"
  hostname_3 = "mon01"
  hostname_4 = "ans01"
  ID = "231012"

  # ПЕРВАЯ ВИРТУАЛЬНАЯ МАШИНА
  config.vm.define "#{hostname_1}" do |subconfig|
    # имя виртуальной машины
    subconfig.vm.provider "virtualbox" do |vb|
      vb.name = "#{hostname_1}_ID#{ID}"
      vb.cpus=1
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--description", "Web VM: NGINX, phpMyAdmin, Piwigo,"]      
    end
    # hostname виртуальной машины
    subconfig.vm.hostname = "#{hostname_1}"
    # настройки сети
    subconfig.vm.network "private_network", ip: "192.168.53.101"
    subconfig.vm.network "forwarded_port", guest: 80, host: 8080, id: "nginx"
    subconfig.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install nginx -y
    service nginx start
    SHELL
  end

  # ВТОРАЯ ВИРТУАЛЬНАЯ МАШИНА
  config.vm.define "#{hostname_2}" do |subconfig|
    # имя виртуальной машины
    subconfig.vm.provider "virtualbox" do |vb|
      vb.name = "#{hostname_2}_ID#{ID}"
      vb.cpus=1
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--description", "DataBase VM: mysql-server. Users: [root, user], pass: Qaz.123"]      
    end
    # hostname виртуальной машины
    subconfig.vm.hostname = "#{hostname_2}"
    # настройки сети
    subconfig.vm.network "private_network", ip: "192.168.53.102"
    # установка пакетов
    subconfig.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install mysql-server -y
    SHELL
  end
  
  # ТРЕТЬЯ ВИРТУАЛЬНАЯ МАШИНА
  config.vm.define "#{hostname_3}" do |subconfig|
    # имя виртуальной машины
    subconfig.vm.provider "virtualbox" do |vb|
      vb.name = "#{hostname_3}_ID#{ID}"
      vb.cpus=1
      vb.customize ["modifyvm", :id, "--memory", "4096"]
      vb.customize ["modifyvm", :id, "--description", "Monitor VM: Grafana, prometheus"]
    end
    # hostname виртуальной машины
    subconfig.vm.hostname = "#{hostname_3}"
    # настройки сети
    subconfig.vm.network "private_network", ip: "192.168.53.103"
    subconfig.vm.provision "shell", path: "E:/DOps/vagrant_ID231012/Grafana.sh"
    subconfig.vm.provision "shell", path: "E:/DOps/vagrant_ID231012/prometheus.sh" 
  end

  # ЧЕТВЕРТАЯ ВИРТУАЛЬНАЯ МАШИНА
  config.vm.define "#{hostname_4}" do |subconfig|
    # имя виртуальной машины
    subconfig.vm.provider "virtualbox" do |vb|
      vb.name = "#{hostname_4}_ID#{ID}"
      vb.cpus=1
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--description", "Ansible VM"]
    end
    # hostname виртуальной машины
    subconfig.vm.hostname = "#{hostname_4}"
    # настройки сети
    subconfig.vm.network "private_network", ip: "192.168.53.104"
    # установка Ansible
    subconfig.vm.provision "shell", inline: <<-SHELL
    sudo apt update
    sudo apt install software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install ansible -y
    SHELL
  end

  # обновление всех системы 
  # config.vm.provision "update", type: "shell", inline: "apt-get update && apt-get upgrade -y"
end
