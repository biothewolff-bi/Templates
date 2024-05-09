
terraform {
  required_version = "1.7.5"

  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.87.2"
    }
  }
}

# Create project database
resource "snowflake_database" "db" {
  name = "SC_${var.upper_project}_${var.upper_environment}_DB"
  comment = "${var.upper_environment} database used by the ${var.upper_project} team"
}

# Create schemas in the project database
resource "snowflake_schema" "schema" {
  for_each = toset(var.schemas)
  database = snowflake_database.db.name
  name     = each.value
}

locals {
  service_accounts = { for s in var.service_accounts : s.user => s}
  custom_roles = { for s in var.custom_roles : s.name => s }
  warehouses = { for s in var.warehouses : s.name => s }
}

# Create randow passwords for service accounts
resource "random_password" "password" {
  for_each = local.service_accounts
  length           = 16
  special          = true
  override_special = "_%@"
}

# Create service accounts
resource "snowflake_user" "service_accounts" {
  for_each = local.service_accounts
  name         = "SP_${each.key}_${var.upper_environment}"
  password     = random_password.password[each.key].result
  disabled     = false
  display_name = "${each.key} service user for ${var.upper_project} - ${var.upper_environment}"

  must_change_password    = false
  depends_on = [ random_password.password ]
}

# Create roles
resource "snowflake_role" "roles" {
  for_each = local.custom_roles
  name    = "RL_${var.upper_project}_${var.upper_environment}_${each.key}"
  comment = "${each.key} role for ${var.upper_project}"
}

# Grant all privileges on the database to role admin
resource "snowflake_grant_privileges_to_account_role" "grant_all_db_role_privileges" {
  for_each = var.all_privileges_to_role_on_db
  account_role_name  = "RL_${var.upper_project}_${var.upper_environment}_${each.key}"
  all_privileges = true
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.db.name
  } 
  depends_on = [snowflake_role.roles, snowflake_database.db, snowflake_schema.schema]
}

# Grant all privileges on all schemas in database to role admin
resource "snowflake_grant_privileges_to_account_role" "grant_all_schemas_role_privileges" {
  for_each = var.all_privileges_to_role_on_all_schemas
  all_privileges    = true
  account_role_name  = "RL_${var.upper_project}_${var.upper_environment}_${each.key}"
  on_schema {
    all_schemas_in_database = snowflake_database.db.name
  }
  depends_on = [snowflake_role.roles, snowflake_database.db, snowflake_schema.schema]
}

# Grant all privileges on all future schemas in database to role admin
resource "snowflake_grant_privileges_to_account_role" "grant_all_future_schemas_role_privileges" {
  for_each = var.all_privileges_to_role_on_all_future_schemas
  all_privileges    = true
  account_role_name  = "RL_${var.upper_project}_${var.upper_environment}_${each.key}"
  on_schema {
    future_schemas_in_database = snowflake_database.db.name
  }
  depends_on = [snowflake_role.roles, snowflake_database.db, snowflake_schema.schema]
}


# Grant all privileges all tables in database to role admin
resource "snowflake_grant_privileges_to_account_role" "grant_all_tables_role_privileges" {
  for_each = var.all_privileges_to_role_on_all_tables
  all_privileges    = true
  account_role_name  = "RL_${var.upper_project}_${var.upper_environment}_${each.key}"
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_database = snowflake_database.db.name
    }
  }
  depends_on = [snowflake_role.roles, snowflake_database.db, snowflake_schema.schema]
}

# Grant all privileges on all future tables in database to role admin
resource "snowflake_grant_privileges_to_account_role" "grant_all_future_tables_role_privileges" {
  for_each = var.all_privileges_to_role_on_all_future_tables
  all_privileges    = true
  account_role_name  = "RL_${var.upper_project}_${var.upper_environment}_${each.key}"
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database = snowflake_database.db.name
    }
  }
  depends_on = [snowflake_role.roles, snowflake_database.db, snowflake_schema.schema]
}

# Grant usage privilege on the database to role reader
resource "snowflake_grant_privileges_to_account_role" "grant_usage_db_role_privileges" {
  for_each = var.usage_privileges_to_role_on_db
  account_role_name  = "RL_${var.upper_project}_${var.upper_environment}_${each.key}"
  privileges = ["USAGE"]
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.db.name
  } 
  depends_on = [snowflake_role.roles, snowflake_database.db, snowflake_schema.schema]
}

# Grant usage privileges on all schemas in database to role reader
resource "snowflake_grant_privileges_to_account_role" "grant_usage_schema_role_privileges" {
  for_each = var.usage_to_role_on_all_schemas
  privileges = ["USAGE"]
  account_role_name  = "RL_${var.upper_project}_${var.upper_environment}_${each.key}"
  on_schema {
    all_schemas_in_database = snowflake_database.db.name
  }
  depends_on = [snowflake_role.roles, snowflake_database.db, snowflake_schema.schema]
}

# Grant usage privileges on all future schemas in database to role reader
resource "snowflake_grant_privileges_to_account_role" "grant_usage_future_schema_role_privileges" {
  for_each = var.usage_to_role_on_all_schemas
  privileges = ["USAGE"]
  account_role_name  = "RL_${var.upper_project}_${var.upper_environment}_${each.key}"
  on_schema {
    future_schemas_in_database = snowflake_database.db.name
  }
  depends_on = [snowflake_role.roles, snowflake_database.db, snowflake_schema.schema]
}


# Grant select privileges all tables in database to role reader
resource "snowflake_grant_privileges_to_account_role" "grant_select_tables_role_privileges" {
  for_each = var.select_to_role_on_all_tables
  privileges = ["SELECT"]
  account_role_name  = "RL_${var.upper_project}_${var.upper_environment}_${each.key}"
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_database = snowflake_database.db.name
    }
  }
  depends_on = [snowflake_role.roles, snowflake_database.db, snowflake_schema.schema]
}

# Grant all privileges on all future tables in database to role admin
resource "snowflake_grant_privileges_to_account_role" "grant_select_future_tables_role_privileges" {
  for_each = var.select_to_role_on_all_future_tables
  privileges = ["SELECT"]
  account_role_name  = "RL_${var.upper_project}_${var.upper_environment}_${each.key}"
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database = snowflake_database.db.name
    }
  }
  depends_on = [snowflake_role.roles, snowflake_database.db, snowflake_schema.schema]
}

# Grant ownership to SYSADMIN on all custom roles
resource "snowflake_role_ownership_grant" "grant_role_ownership" {
  for_each = local.custom_roles
  on_role_name   = "RL_${var.upper_project}_${var.upper_environment}_${each.key}"
  to_role_name   = each.value.owner
  depends_on = [ snowflake_role.roles ]
}

# Grant custom roles to SYSADMIN
resource "snowflake_grant_account_role" "grant_role_to_role" {
  for_each = local.custom_roles
  role_name = "RL_${var.upper_project}_${var.upper_environment}_${each.key}"
  parent_role_name = "SYSADMIN"
  depends_on = [ snowflake_role.roles, snowflake_user.service_accounts, snowflake_role_ownership_grant.grant_role_ownership ]
}

# Grant custom roles to users
resource "snowflake_grant_account_role" "grant_role_to_user" {
  for_each = local.service_accounts
  role_name = each.value.assigned_role
  user_name = "SP_${each.key}_${var.upper_environment}"
  depends_on = [ snowflake_role.roles, snowflake_user.service_accounts, snowflake_grant_account_role.grant_role_to_role ]
}

# Create warehouses
resource "snowflake_warehouse" "warehouse" {
  for_each = local.warehouses
  name           = "WH_${each.key}_${var.upper_project}_${var.upper_environment}"
  comment        = "${each.value.size} Warehouse for the project ${var.upper_project} in ${var.upper_environment} environment"
  warehouse_size = each.value.size
}

# Grant all privileges on all future tables in database to role admin
resource "snowflake_grant_privileges_to_account_role" "grant_usage_operate_warehouse_query_role_privileges" {
  for_each = var.usage_operate_warehouse_query
  privileges = ["USAGE", "OPERATE"]
  account_role_name  = "RL_${var.upper_project}_${var.upper_environment}_${each.value}"
  on_account_object {
    object_name = "WH_QUERY_${var.upper_project}_${var.upper_environment}"
    object_type = "WAREHOUSE"
  }
  depends_on = [snowflake_role.roles, snowflake_warehouse.warehouse]
}

# Grant all privileges on all future tables in database to role admin
resource "snowflake_grant_privileges_to_account_role" "grant_usage_operate_warehouse_adf_role_privileges" {
  for_each = var.usage_operate_warehouse_adf
  privileges = ["USAGE", "OPERATE"]
  account_role_name  = "RL_${var.upper_project}_${var.upper_environment}_${each.value}"
  on_account_object {
    object_name = "WH_ADF_${var.upper_project}_${var.upper_environment}"
    object_type = "WAREHOUSE"
  }
  depends_on = [snowflake_role.roles, snowflake_warehouse.warehouse]
}

# Grant all privileges on all future tables in database to role admin
resource "snowflake_grant_privileges_to_account_role" "grant_usage_operate_warehouse_dbt_role_privileges" {
  for_each = var.usage_operate_warehouse_dbt
  privileges = ["USAGE", "OPERATE"]
  account_role_name  = "RL_${var.upper_project}_${var.upper_environment}_${each.value}"
  on_account_object {
    object_name = "WH_DBT_${var.upper_project}_${var.upper_environment}"
    object_type = "WAREHOUSE"
  }
  depends_on = [snowflake_role.roles, snowflake_warehouse.warehouse]
}

# Grant all privileges on all future tables in database to role admin
resource "snowflake_grant_privileges_to_account_role" "grant_usage_operate_warehouse_analytics_role_privileges" {
  for_each = var.usage_operate_warehouse_analytics
  privileges = ["USAGE", "OPERATE"]
  account_role_name  = "RL_${var.upper_project}_${var.upper_environment}_${each.value}"
  on_account_object {
    object_name = "WH_ANALYTICS_${var.upper_project}_${var.upper_environment}"
    object_type = "WAREHOUSE"
  }
  depends_on = [snowflake_role.roles, snowflake_warehouse.warehouse]
}