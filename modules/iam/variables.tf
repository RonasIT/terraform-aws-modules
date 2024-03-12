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
