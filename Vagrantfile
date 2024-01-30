# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |conf|
	# Variables
	BOX_IMAGE = "ubuntu/jammy64"
	
	BASE_INT_NETWORK = "10.10.20"
	BASE_HOST_ONLY_NETWORK = "192.168.56"
	
	PROXY_URL = "http://10.20.5.51:8888"
	NO_PROXY = "localhost,127.0.0.1"
	PROXY_ENABLE = true
	
	SSH_KEY = false
	
	# --- WEB VM ---
	conf.vm.define "web" do |webconf|
		# Info
		webconf.vm.box = BOX_IMAGE
		webconf.vm.hostname = "web.m340" #ask cause it no work .
		
		# Proxy
		if Vagrant.has_plugin?("vagrant-proxyconf") && PROXY_ENABLE
			webconf.proxy.http = PROXY_URL
			webconf.proxy.https = PROXY_URL
			webconf.proxy.no_proxy = NO_PROXY
		else
			webconf.vm.provision "shell", inline: "echo 'No vagrant-proxyconf plugin found. Please install the plugin.'"
		end
		
		# Network
		webconf.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.10", virtualbox__intnet: true
		webconf.vm.network "private_network", ip: "#{BASE_HOST_ONLY_NETWORK}.10"
		
		# Sync Folder
		webconf.vm.synced_folder "./site", "/var/www/html"
		
		# SSH
		webconf.ssh.insert_key = SSH_KEY
		
		# VirtualBox
		webconf.vm.provider "virtualbox" do |vb|
			vb.name = "web.m340"
			vb.gui = true
			vb.memory = "1024"
		end
		
		# Scripts
		webconf.vm.provision "shell", path: "scripts/install_apache_php.sh"
	end
	
	# --- DB VM ---
	conf.vm.define "db" do |dbconf|
		# Info
		dbconf.vm.box = BOX_IMAGE
		dbconf.vm.hostname = "db.m340"
		
		# Proxy
		if Vagrant.has_plugin?("vagrant-proxyconf") && PROXY_ENABLE
			dbconf.proxy.http = PROXY_URL
			dbconf.proxy.https = PROXY_URL
			dbconf.proxy.no_proxy = NO_PROXY
		else
			dbconf.vm.provision "shell", inline: "echo 'No vagrant-proxyconf plugin found. Please install the plugin.'"
		end
		
		# Network
		dbconf.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.11", virtualbox__intnet: true
		
		# SSH
		dbconf.ssh.insert_key = SSH_KEY
		
		# VirtualBox
		dbconf.vm.provider "virtualbox" do |vb|
			vb.name = "db.m340"
			vb.gui = true
			vb.memory = "1024"
		end
		
		# Scripts
		dbconf.vm.provision "shell", path: "scripts/install_mysql.sh"
	end
end