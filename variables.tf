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

variable "top_level_group" {
  type        = string
  description = "GitLab top level group"
}

variable "top_level_group_id" {
  type        = string
  description = "GitLab top level group"
  sensitive = true
}

variable "top_level_group_description" {
  type        = string
  description = "GitLab top level group description"
}

variable "top_level_group_path" {
  type        = string
  description = "GitLab top level group path"
}
