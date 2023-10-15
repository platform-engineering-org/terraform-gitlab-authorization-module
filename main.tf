data "gitlab_group" "top_level_group" {
  full_path = var.top_level_group_full_path
}

data "gitlab_user" "bot_user" {
  username = var.bot_user_name
}

resource "gitlab_group_membership" "bot_user_membership" {
  group_id     = data.gitlab_group.top_level_group.id
  user_id      = data.gitlab_user.bot_user.id
  access_level = "owner"
}

resource "gitlab_group_ldap_link" "developers_group" {
  group         = data.gitlab_group.top_level_group.id
  cn            = var.ldap_developers_group
  group_access  = "developer"
  ldap_provider = "ldapmain"
}

resource "gitlab_group_ldap_link" "owners_group" {
  group         = data.gitlab_group.top_level_group.id
  cn            = var.ldap_owners_group
  group_access  = "owner"
  ldap_provider = "ldapmain"
}
