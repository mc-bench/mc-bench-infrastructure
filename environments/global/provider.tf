terraform {
    required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }

  backend "s3" {
    endpoints = {
      s3 = "https://nyc3.digitaloceanspaces.com"
    }
    region                          = "nyc3"
    bucket                          = "mc-bench-terraform-remote-state"
    key                             = "environments/global/terraform.tfstate"
    skip_credentials_validation     = true
    skip_region_validation          = true
    skip_requesting_account_id      = true
    skip_metadata_api_check         = true
    skip_s3_checksum                = true
    use_path_style                 = true
  }

}

provider "digitalocean" {}
