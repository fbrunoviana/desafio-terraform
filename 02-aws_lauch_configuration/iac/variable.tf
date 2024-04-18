variable "port_guelo" {
  description = "Port for app guelo burn"
  default     = 8080
  type        = number
}
variable "guelo_directory" {
  description = "Directory where the app is deployed"
  type = string
  default = "/var/www/html"
}