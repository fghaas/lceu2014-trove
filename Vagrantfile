# -*- mode: ruby -*-
# vi: set ft=ruby :

# Set the amount of RAM you want to allocate to the VM. The default
# (3G) is the minimum, set this to higher if you have RAM to spare
ram = 3072

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "trusty-server-cloudimg-amd64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  config.vm.network :private_network, ip: "192.168.122.111"

  # Set the hostname
  config.vm.hostname = "devstack"

  # Configure the synced folder to use rsync instead of the default
  # (so the "libvirt" provider doesn't need to mess with NFS)
  config.vm.synced_folder ".", "/vagrant", type: "rsync"

  # VirtualBox specific settings.
  config.vm.provider :virtualbox do |vb|
    # Boot with a GUI so you can see the screen. (Default is headless)
    vb.gui = true

    # Set the amount of memory specified above
    vb.memory = ram
  end

  # Libvirt specific settings
  config.vm.provider :libvirt do |domain|
    domain.memory = ram
    domain.nested = false
    domain.storage :file, :size => '10G', :device => 'vda'
  end

  # Run the provisioning script
  config.vm.provision "shell", path: "provision-root.sh"

end
