terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "16.1.0"
    }
  }
}

provider "gitlab" {
}
