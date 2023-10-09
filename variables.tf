variable "token" {
  type        = string
  description = "Gitlab token"
  sensitive   = true
}

variable "insecure" {
  type        = string
  description = "Do not verify certifcate if true"
  default     = true
}

variable "base_url" {
  type        = string
  description = "gitlab api end point"
  default     = "https://gitlab.com/api/v4/"
}

variable "top_level_group_full_path" {
  type        = string
  description = "GitLab top level group full path"
}

variable "ldap_developers_group" {
  type        = string
  description = "LDAP developers group"
}

variable "ldap_owners_group" {
  type        = string
  description = "LDAP owners group"
}
