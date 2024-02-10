
terraform {
    required_version = ">= 0.14"
    required_providers {
      proxmox = {
        source = "fortel/telmate/proxmox"
        version = ">= 1.0.0"
      }
    }
    
    
}

variable "proxmox_api_url" {
    type = string
}

variable "proxmox_api_token_id" {
    type = string
    sensitive = true
}

variable "proxmox_api_token_secret" {
    type = string
    sensitive = true
}


provider "proxmox" {
    pm_tls_insecure = true
    pm_api_url = var.proxmox_api_url
    pm_api_token_id = var.proxmox_api_token_id
    pm_api_token_secret = var.proxmox_api_token_secret
}