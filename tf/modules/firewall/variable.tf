variable "network"{
    type= string
    description = "The network ID"
    default = "default"
}
variable "target_tags" {
    type = list(string)
    default = ["http","https"]
}