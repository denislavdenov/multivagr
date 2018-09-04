Vagrant.configure("2") do |config|
    config.vm.synced_folder ".", "/vagrant", disabled: false
  (1..2).each do |i|
    config.vm.define vm_name="web#{i}" do |node|
      node.vm.box = "denislavd/base-xenial64"
      node.vm.hostname = vm_name
      node.vm.provision :shell, path: "scripts/provision.sh"
      node.vm.network "private_network", ip: "192.168.56.10#{i}"
      node.vm.network "forwarded_port", guest: 80, host: 8080 + i
      end
    end
   config.vm.define vm_name="mysql" do |node|
    node.vm.box = "denislavd/mysql64"
    node.vm.hostname = vm_name
    node.vm.network "private_network", ip: "192.168.56.103"
  end 
end
