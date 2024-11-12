provider "google" {
    credentials = file("~/.config/gcloud/application_default_credentials.json") 
    project = var.project_id
}
module "instances" {
    name = "se347-wordpress"
    machine_type = "e2-medium"
    source = "./modules/instances"
    target_tags=["http","https"]
}
module "firewall" {
    target_tags = ["http","https"]
    source  = "./modules/firewall"
}