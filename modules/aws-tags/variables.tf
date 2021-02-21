# See required tags and example values in Documentation 

variable "application" {
  description = "The application these resources are running"

  default = "missing_definition"
  type    = string
}

variable "environment" {
  description = "Name of the environment"

  default = "missing_definition"
  type    = string
}

# See this page for data class clasification in Documentation 
variable "data_class" {
  description = "The data class (and hence protections) that applies to this cluster"

  default = "missing_definition"
  type    = string
}

variable "owner" {
  description = "Name of the team responsible for these resources"

  default = "missing_definition"
  type    = string
}

variable "bounded_context" {
  description = "The bounded context this application belongs to"

  default = "missing_definition"
  type    = string
}

variable "cost_center" {
  description = "The cost center to attribute the resources to"

  default = "missing_definition"
  type    = string
}


# Variables related to Core Foundation tags (please keep that in alphabetical order)

variable "account" {
  description = "AWS account name or alias"

  default = "missing_definition"
  type    = string
}

variable "application_role" {
  description = "Optional application role"

  default = "missing_definition"
  type    = string
}

variable "business_criticality" {
  description = "Describe level of criticality for the business"

  default = "missing_definition"
  type    = string
}

variable "saving_plan" {
  description = "If resource can be shut down for cost saving on defined days. Values: yes OR no"

  default = "missing_definition"
  type    = string
}

variable "site" {
  description = "Bean site - primary OR secondary"

  default = "missing_definition"
  type    = string
}

# / Variables related to Core Foundation tags (please keep that in alphabetical order)
