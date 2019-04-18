Vagrant.configure(2) do |config|
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4086"
    vb.cpus = "2"
#    vb.gui = true
  end
    config.disksize.size = '25GB'
#    config.vm.network "public_network", bridge: "1) ensp2", bootproto: "dhcp"
      config.vm.network "public_network", ip: "172.17.191.213", bridge: "igb0: e1000g0 - Intel PRO/1000 Gigabit Ethernet", auto_config: true,
    :mac => "525400c9c709",
    :netmask => "255.255.0.0"

    config.vm.box = "ubuntu/bionic64"
    config.vm.provision "shell",
       run: "always",
       inline: "route add default gw 172.17.1.1"
    config.vm.provision "shell",
       run: "always",
       inline: "dpkg --add-architecture i386 && sudo apt-get update -y"
    config.vm.synced_folder "vagrant", "/vagrant", :mount_options => ["rw"]
    config.vm.synced_folder "vagrant/install", "/sikulix", :mount_options => ["ro"]
    config.vm.provision :ansible_local do |ansible|
      ansible.playbook = "ub1810-crossover-playbook.yml"
      ansible.extra_vars = { ansible_python_interpreter:"/usr/bin/python3" }
      ansible.compatibility_mode = "2.0"
     config.vm.provision "shell",
       run: "always",
       inline: 'dpkg --add-architecture i386 && sudo apt-get update -y && sudo sed -i -E "s/#  AutomaticLoginEnable = false/AutomaticLoginEnable = true/"  /etc/
gdm3/custom.conf && sudo sed -i -E "s/#  AutomaticLogin = user1/AutomaticLogin = vagrant/"  /etc/gdm3/custom.conf && sudo ln -s /vagrant/sikulix.sh /etc/profile
.d/sikulix.sh'
    config.vm.provision :reload
   end
end