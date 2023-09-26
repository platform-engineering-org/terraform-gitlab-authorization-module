terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "16.4.1"
    }
  }
}

provider "gitlab" {
  token    = var.token
  base_url = var.base_url
  insecure = var.insecure
}

resource "gitlab_user" "bot_user" {
  name     = var.gitlab_bot_user_name
  username = var.gitlab_bot_user_username
  email    = var.gitlab_bot_user_email
}

resource "gitlab_group" "top_level_group" {
  name = var.top_level_group_name
  path = var.top_level_group_path
}

resource "gitlab_group_ldap_link" "developers_group" {
  group         = gitlab_group.top_level_group.id
  cn            = var.ldap_developers_group
  group_access  = "developer"
  ldap_provider = "ldapmain"
}

resource "gitlab_group_ldap_link" "owners_group" {
  group         = gitlab_group.top_level_group.id
  cn            = var.ldap_owners_group
  group_access  = "developer"
  ldap_provider = "ldapmain"
}
