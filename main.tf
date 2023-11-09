data "gitlab_group" "top_level_group" {
  full_path = var.top_level_group_full_path
}

data "gitlab_projects" "group_projects" {
  group_id          = data.gitlab_group.top_level_group.id
  include_subgroups = true
  archived          = false
}

data "gitlab_user" "bot_user" {
  username = var.bot_user_name
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

resource "gitlab_branch_protection" "branch_protection" {
  for_each                     = { for project in data.gitlab_projects.group_projects.projects : project.id => project }
  project                      = each.key
  branch                       = "main"
  push_access_level            = "maintainer"
  merge_access_level           = "maintainer"
  unprotect_access_level       = "maintainer"
  allow_force_push             = false
  code_owner_approval_required = true
}
