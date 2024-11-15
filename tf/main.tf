provider "google" {
    credentials = file("~/.config/gcloud/application_default_credentials.json") 
    project = var.project_id
}
module "instances" {
    name = "se347-wordpress"
    machine_type = "e2-medium"
    source = "./modules/instances"
    target_tags=["http","https"]
    startup_script = <<EOF
        #!/bin/bash
        mkdir -p /opt/init-script 
        cd /opt/init-script
        git clone https://github.com/ngodat0103/common-stuff.git
        cd common-stuff/0-shell/0-Installation
        chmod +x docker-installation.sh
        ./docker-installation.sh
        usermod -aG docker ubuntu
        wget http://nextcloud.ngodat0103.live/index.php/s/wordpress/download/iAViXXr.7z
        apt install -y p7zip-full -y
        7z x iAViXXr.7z 
        docker volume create wordpress
        docker volume create wordpress-data
        tar -xvf mysql_backup.tar --strip 3 -C /var/lib/docker/volumes/wordpress-db/_data/
        tar -xvf wordpress_backup.tar --strip 3 -C /var/lib/docker/volumes/wordpress/_data/
        cd /opt
        git clone https://github.com/ngodat0103/se347-wordpress.git
        # Create a .env file manually
        # and using docker compose up -d to start the wordpress
    EOF
}
module "firewall" {
    target_tags = ["http","https"]
    source  = "./modules/firewall"
}