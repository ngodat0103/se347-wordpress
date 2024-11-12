resource "google_compute_address" "ip-public-instance" {
  name = var.name
  region = var.region
  labels =  {
    environment = var.environment
  }
  address_type = "EXTERNAL"
}

resource "google_compute_instance" "instance" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone
  labels ={
    environment = var.environment 
  }
  tags         = var.target_tags
  boot_disk {
    initialize_params {
    labels = {
        environment = var.environment
    } 
      image = var.image
      size  = var.boot_disk_size
    }
  }
  network_interface {
    network = var.network
    subnetwork = var.subnetwork
    access_config {
      nat_ip = google_compute_address.ip-public-instance.address
    }
  }
  metadata = {
    ssh-keys = join("\n",
      [for path in var.pub_key_paths : "ubuntu:${file(path)}"] 
    )
  }
  metadata_startup_script = var.startup_script
}