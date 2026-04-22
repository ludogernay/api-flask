variable "image_url" {
  type        = string
  description = "URL de l'image Docker sans le tag (ex: ghcr.io/user/repo)"
  default = "ghcr.io/ludogernay/api-flask"
}

variable "image_tag" {
  type        = string
  description = "Tag de l'image Docker"
  default     = "latest"
}

variable "app_name" {
  type        = string
  description = "Nom du service Render"
  default     = "flask-api-demo"
}

variable "region" {
  type        = string
  description = "Région Render"
  default     = "frankfurt"
}

variable "plan" {
  type        = string
  description = "Plan Render"
  default     = "free"
}