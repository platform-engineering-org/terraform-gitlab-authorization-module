terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "16.3.0"
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

locals {
  users_groups = [
    {
      name = var.gitlab_owner_users_group
      role = "owner"
    },
    {
      name = var.gitlab_developer_users_group
      role = "developer"
    }
  ]
}

resource "gitlab_group_ldap_link" "ldap_link" {
  for_each   = {
    for index, user_group in local.users_groups: user_group.name => user_group
  }
  group         = gitlab_group.top_level_group.id
  cn            = each.value.name
  group_access  = each.value.role
  ldap_provider = "ldapmain"
}
