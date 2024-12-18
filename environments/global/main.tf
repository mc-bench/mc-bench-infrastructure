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

resource "digitalocean_project" "dev" {
  name        = "mc-bench-dev"
  description = "mc-bench-dev"
  purpose     = "Website or blog"
  environment = "Development"
}

resource "digitalocean_project" "prod" {
  name        = "mc-bench-prod"
  description = "mc-bench-prod"
  purpose     = "Website or blog"
  environment = "Production"
}


resource "digitalocean_project_resources" "project_resources" {
  project = digitalocean_project.global.id
  resources = [
    digitalocean_spaces_bucket.terraform_state.urn
  ]
}