variable "project" {
  type        = string
  default     = ""
  description = "(Optional) The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
}

variable "display_name" {
  type        = string
  default     = ""
  description = " A user-assigned name for this group, used only for display purposes."
}

variable "filter" {
  type        = string
  default     = ""
  description = "The filter used to determine which monitored resources belong to this group."
}

variable "parent_name" {
  type        = string
  default     = ""
  description = "(Optional) The name of the group's parent, if it has one. The format is "projects/{project_id_or_number}/groups/{group_id}""
}

variable "is_cluster" {
  type        = string
  default     = ""
  description = "(Optional) If true, the members of this group are considered to be a cluster."
}



