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
}

variable "top_level_group_path" {
  type        = string
  description = "GitLab top level group path"
}

variable "gitlab_users_group" {
  type        = string
  description = "GitLab users group"
}
