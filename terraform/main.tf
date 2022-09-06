terraform {
  backend "gcs" {
   bucket = "terraform-rare-mechanic-358909"
   prefix = "vidicore-dev/front-end"
  }

  required_providers {
    google = {
      source                    = "hashicorp/google"
      version                   = "4.24.0"
    }
  }
}

provider "google" {
  project                       = var.project_name
}

resource "google_compute_global_address" "default" {
  name                        = var.external_ip_address
}

resource "google_compute_security_policy" "security_policy" {
  name = var.cloud_armor_policy

  rule {
    action   = "allow"
    priority = "0"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["34.238.5.53/32"]
      }
    }
    description = "Allow OpenVPN"
  }

  rule {
    action   = "deny(403)"
    priority = "2147483647"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    description = "Deny All"
  }
}