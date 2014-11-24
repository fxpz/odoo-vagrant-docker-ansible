# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/playbook.yaml"
    ansible.groups = {
            "db_master" => ["pgsqlmaster"],
            "db_slave" => ["pgsqlslave"],
            "webserver" => ["webserver"],
            "db:children" => ["db_master", "db_slave"]
    }
  end
 
  config.vm.define "pgsqlmaster" do |p|
    p.vm.provider "docker" do |d|
	d.expose    = [5432]
	d.name 	    = "pgsqlmaster"
    end
  end

  config.vm.define "pgsqlslave" do |p|
    p.vm.provider "docker" do |d|
	d.name 	    = "pgsqlslave"
	d.link("pgsqlmaster:pgsqlmaster")
    end
  end

  config.vm.define "webserver" do |p|
    p.vm.provider "docker" do |d|
	d.name 	    = "webserver"
	d.ports	    = ['8069:8069']
	d.link("pgsqlmaster:pgsqlmaster")
    end
    p.vm.provision :shell, :inline => 'echo -e "\n\n\tYour odoo installation should be available at:\n\thttp://localhost:8069/\n\n"'
  end

  config.vm.provider "docker" do |d|
    d.build_dir = "."
    d.has_ssh   = true
  end

  config.ssh.username = "root"
  config.ssh.private_key_path = "ssh/id_rsa"
  config.vm.synced_folder "ssh", "/root/.ssh"

end
