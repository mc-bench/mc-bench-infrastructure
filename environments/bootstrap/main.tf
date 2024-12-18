terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {}

resource "digitalocean_spaces_bucket" "terraform_state" {
  name   = "mc-bench-terraform-remote-state"
  region = "nyc3"
  acl    = "private"

  versioning {
    enabled = true
  }
}

resource "digitalocean_project" "global" {
  name        = "mc-bench-global"
  description = "mc-bench-global"
  purpose     = "Website or blog"
  environment = "Production"
  is_default  = true
}

resource "digitalocean_project_resources" "project_resources" {
  project = digitalocean_project.global.id
  resources = [
    digitalocean_spaces_bucket.terraform_state.urn
  ]
}
