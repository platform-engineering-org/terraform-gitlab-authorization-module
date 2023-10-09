data "gitlab_group" "top_level_group" {
  full_path = var.top_level_group_full_path
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
