sudo apt-get update
sudo apt-get -qy install salt-minion
echo "master: 192.168.12.100" > /etc/salt/minion
sudo service salt-minion restart
MINION

$master = <<MASTER
sudo apt-get update
sudo apt-get -qy install curl
mkdir -p /etc/apt/keyrings
curl -fsSL https://packages.broadcom.com/artifactory/api/security/keypair/SaltProjectKey/public | sudo tee /etc/apt/keyrings/salt-archive-keyring.pgp
curl -fsSL https://github.com/saltstack/salt-install-guide/releases/latest/download/salt.sources | sudo tee /etc/apt/sources.list.d/salt.sources
sudo apt-get update
sudo apt-get -qy install salt-master
MASTER

Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"  # Changed box to Debian Bookworm

  config.vm.define "db1" do |db1|
    db1.vm.memory = "2048"
    db1.vm.provision :shell, inline: $minion
    db1.vm.network "private_network", ip: "192.168.12.101"
    db1.vm.hostname = "db1"
  end

	  config.vm.define "web2" do |web2|
                web2.vm.memory = "2048"
		web2.vm.provision :shell, inline: $minion
		web2.vm.network "private_network", ip: "192.168.12.102"
		web2.vm.hostname = "web2"
	end

	config.vm.define "tmaster", primary: true do |tmaster|
                tmaster.vm.memory = "2048"
		tmaster.vm.provision :shell, inline: $master
		tmaster.vm.network "private_network", ip: "192.168.12.100"
		tmaster.vm.hostname = "tmaster"
	end
end
