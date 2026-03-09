BOX_IMAGE = "bento/ubuntu-24.04"

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vm_config, override|
    vm_config.customize [
      "modifyvm", :id,
      "--natdnshostresolver1", "on",
      # some systems also need this:
      "--natdnshostresolver2", "on"
    ]
  end

  config.vm.box = BOX_IMAGE

  # Configure vagrant-dns for example.test domain
  config.dns.tld = "example.test"

  # Common provisioner script
  SSH_PROVISION_SCRIPT = <<-SHELL
    mkdir -p /home/vagrant/.ssh
    echo "#{File.read("#{Dir.home}/.ssh/id_rsa.pub")}" >> /home/vagrant/.ssh/authorized_keys
    chmod 700 /home/vagrant/.ssh
    chmod 600 /home/vagrant/.ssh/authorized_keys
    chown -R vagrant:vagrant /home/vagrant/.ssh
  SHELL

  # Common VM settings
  config.vm.provider "vmware_desktop" do |vwd|
    vwd.ssh_info_public = true
    vwd.vmx["memsize"] = "2048"
    vwd.vmx["numvcpus"] = "1"
  end

  config.vm.define "app-host" do |node|
    node.vm.hostname = "app-host"
    node.dns.patterns = [/^.*app-host\.example\.test$/]
#    node.vm.network :private_network, ip: "192.168.56.10"
    node.vm.network "public_network", bridge: "enp5s1", ip: "192.168.0.96"
    node.vm.provision "shell", inline: SSH_PROVISION_SCRIPT
  end

  config.vm.define "monitoring" do |node|
    node.vm.hostname = "monitoring"
    node.dns.patterns = [/^.*monitoring\.example\.test$/]
#    node.vm.network :private_network, ip: "192.168.56.11"
    node.vm.network "public_network", bridge: "enp5s1", ip: "192.168.0.97"
    node.vm.provision "shell", inline: SSH_PROVISION_SCRIPT
  end
end
