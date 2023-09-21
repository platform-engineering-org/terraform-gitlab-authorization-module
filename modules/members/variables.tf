variable "token" {
  type        = string
  description = "Gitlab token"
  sensitive   = true
}

variable "insecure" {
  type        = string
  description = "Do not verify certifcate if true"
}

variable "base_url" {
  type        = string
  description = "gitlab api end point"
}

variable "top_level_group_name" {
  type        = string
  description = "GitLab top level group name"
  sensitive = true
}

variable "top_level_group_path" {
  type        = string
  description = "GitLab top level group path"
  sensitive = true
}

variable "ldap_developers_group" {
  type        = string
  description = "LDAP developers group"
  sensitive   = true
}

variable "ldap_owners_group" {
  type        = string
  description = "LDAP owners group"
  sensitive   = true
}


variable "gitlab_bot_user_id" {
  type        = number
  description = "GitLab bot user id"
  sensitive = true
}

variable "gitlab_bot_user_name" {
  type        = string
  description = "GitLab bot user name"
  sensitive = true
}

variable "gitlab_bot_user_username" {
  type        = string
  description = "GitLab bot user username"
  sensitive = true
}

variable "gitlab_bot_user_email" {
  type        = string
  description = "GitLab bot user email"
  sensitive = true
}
