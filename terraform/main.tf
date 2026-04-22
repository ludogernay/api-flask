terraform {
  required_version = ">= 1.0"

  required_providers {
    render = {
      source  = "render-oss/render"
      version = "~> 1.0"
    }
  }
}

provider "render" {}

resource "render_web_service" "flask_api" {
  name   = var.app_name
  plan   = var.plan
  region = var.region

  runtime_source = {
    image = {
      image_url = var.image_url
      tag       = var.image_tag
    }
  }

  env_vars = {
    PORT = {
      value = "5000"
    }
    APP_NAME = {
      value = var.app_name
    }
    FLASK_ENV = {
      value = "production"
    }
  }
}