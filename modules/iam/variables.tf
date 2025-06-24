variable "teamlead_members" {
  description = "The usernames of members in the teamlead group (not emails)"
  type        = list(string)
  sensitive   = false
}

variable "developer_members" {
  description = "The usernames of members in the developer group (not emails)"
  type        = list(string)
  sensitive   = false
}

variable "additional_service_accounts" {
  description = "Map of usernames to a list of policy ARNs"
  type        = map(list(string))
}
