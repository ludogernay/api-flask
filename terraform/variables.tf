variable "image_url" {
  type        = string
  description = "URL complète de l'image Docker (ex: ghcr.io/user/repo:latest)"
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
  description = "Plan Render (free, starter, standard...)"
  default     = "free"
}