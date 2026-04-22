terraform {
  required_version = ">= 1.0"

  required_providers {
    render = {
      source  = "render-oss/render"
      version = "~> 1.0"
    }
  }
}

# Authentification via variables d'environnement :
#   RENDER_API_KEY  → clé API Render
#   RENDER_OWNER_ID → ID du compte Render (commence par usr- ou tea-)
provider "render" {}

# ─────────────────────────────────────────────────────────────
# Service Web Render — déploiement depuis une image GHCR
# ─────────────────────────────────────────────────────────────
resource "render_web_service" "flask_api" {
  name   = var.app_name
  plan   = var.plan
  region = var.region

  runtime_source = {
    image = {
      image_url = var.image_url
    }
  }

  env_vars = {
    # Port sur lequel Flask écoute dans le conteneur
    PORT = {
      value = "5000"
    }
    # Nom de l'application (pour logs ou config)
    APP_NAME = {
      value = var.app_name
    }
    # Environnement d'exécution
    FLASK_ENV = {
      value = "production"
    }
  }
}