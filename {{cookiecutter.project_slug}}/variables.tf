variable "project_slug" {
    description = "Slug for the project with no special characters"
    type = string
}

variable "snowflake_account" {
    description = "Snowflake account"
    type = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "schemas" {
  description = "List of schemas to be created in the project database"
  type        = list(string)
}

variable "all_privileges_to_role_on_db" {
  type = set(string)
}

variable "all_privileges_to_role_on_all_schemas" {
  type = set(string)
}

variable "all_privileges_to_role_on_all_future_schemas" {
  type = set(string)
}

variable "all_privileges_to_role_on_all_tables" {
  type = set(string)
}

variable "all_privileges_to_role_on_all_future_tables" {
  type = set(string)
}

variable "usage_privileges_to_role_on_db" {
  type = set(string)
}

variable "usage_to_role_on_all_schemas" {
  type = set(string)
}

variable "usage_to_role_on_all_future_schemas" {
  type = set(string)
}

variable "select_to_role_on_all_tables" {
  type = set(string)
}

variable "select_to_role_on_all_future_tables" {
  type = set(string)
}

variable "custom_roles" {
  type = list(object({
    name=string
    owner=string
  }))
}

variable "service_accounts" {
  type = list(object({
    user=string
    assigned_role=string
  }))
}

variable "warehouses" {
  type = list(object({
    name=string
    size=string
  }))
}

variable "usage_operate_warehouse_query" {
  type = set(string)
}

variable "usage_operate_warehouse_adf" {
  type = set(string)
}

variable "usage_operate_warehouse_dbt" {
  type = set(string)
}

variable "usage_operate_warehouse_analytics" {
  type = set(string)
}

variable "upper_project" {
  type    = string
}

variable "upper_environment" {
  type    = string
}