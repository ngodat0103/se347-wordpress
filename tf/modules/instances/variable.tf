variable "machine_type" {
  description = "Machine type for instances"
  type        = string
  default     = "e2-micro"
}
variable "environment" {
  description = "Environment for instances"
  type        = string
  default     = "dev"
}
variable "region" {
  description = "Region for instances"
  type        = string
  default     = "asia-southeast2"
}
variable "zone" {
  description = "Zone for instances"
  type        = string
  default     = "asia-southeast2-a"
}
variable "image" {
    description = "Image for instances"
    type        = string
    default     = "ubuntu-2204-jammy-v20240927"
}
variable boot_disk_size {
  description = "Size of boot disk"
  type        = number
  default     = 30
}
variable "network" {
  description = "Network for instances"
  type        = string
  default     = "default"
}
variable "subnetwork" {
  description = "Subnet for instances"
  type        = string
  default     = "default"
}
variable "name" {
  description = "Name for instances"
  type        = string
}
variable "pub_key_paths" {
    description = "Path to public key"
    type=list(string)
    default = ["~/.ssh/id_rsa.pub"]
}
variable "startup_script" {
    description = "Startup script for instances"
    type        = string
    default= ""
}
variable  "target_tags"{
  type = list(string)
  default= ["http","https"]
}