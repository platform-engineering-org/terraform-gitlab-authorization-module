terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "16.1.0"
    }
  }
}

provider "gitlab" {
  token    = var.token
  base_url = var.base_url
  insecure = var.insecure
}

resource "gitlab_group" "top_level_group" {
  name        = var.top_level_group
  description = var.top_level_group_description
  path        = var.top_level_group_path
}
