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

variable "gitlab_developer_users_group" {
  type        = string
  description = "GitLab developer users group"
}

variable "gitlab_owner_users_group" {
  type        = string
  description = "GitLab owner users group"
}

variable "gitlab_bot_user_id" {
  type        = number
  description = "GitLab bot user id"
}

variable "gitlab_bot_user_name" {
  type        = string
  description = "GitLab bot user name"
}

variable "gitlab_bot_user_username" {
  type        = string
  description = "GitLab bot user username"
}

variable "gitlab_bot_user_email" {
  type        = string
  description = "GitLab bot user email"
}
