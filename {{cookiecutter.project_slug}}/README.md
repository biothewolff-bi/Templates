<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.7.5 |
| <a name="requirement_snowflake"></a> [snowflake](#requirement\_snowflake) | 0.87.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_snowflake"></a> [snowflake](#provider\_snowflake) | 0.87.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [snowflake_database.db](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/database) | resource |
| [snowflake_grant_account_role.grant_role_to_role](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/grant_account_role) | resource |
| [snowflake_grant_account_role.grant_role_to_user](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/grant_account_role) | resource |
| [snowflake_grant_privileges_to_account_role.grant_all_db_role_privileges](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/grant_privileges_to_account_role) | resource |
| [snowflake_grant_privileges_to_account_role.grant_all_future_schemas_role_privileges](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/grant_privileges_to_account_role) | resource |
| [snowflake_grant_privileges_to_account_role.grant_all_future_tables_role_privileges](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/grant_privileges_to_account_role) | resource |
| [snowflake_grant_privileges_to_account_role.grant_all_schemas_role_privileges](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/grant_privileges_to_account_role) | resource |
| [snowflake_grant_privileges_to_account_role.grant_all_tables_role_privileges](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/grant_privileges_to_account_role) | resource |
| [snowflake_grant_privileges_to_account_role.grant_select_future_tables_role_privileges](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/grant_privileges_to_account_role) | resource |
| [snowflake_grant_privileges_to_account_role.grant_select_tables_role_privileges](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/grant_privileges_to_account_role) | resource |
| [snowflake_grant_privileges_to_account_role.grant_usage_db_role_privileges](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/grant_privileges_to_account_role) | resource |
| [snowflake_grant_privileges_to_account_role.grant_usage_future_schema_role_privileges](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/grant_privileges_to_account_role) | resource |
| [snowflake_grant_privileges_to_account_role.grant_usage_operate_warehouse_adf_role_privileges](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/grant_privileges_to_account_role) | resource |
| [snowflake_grant_privileges_to_account_role.grant_usage_operate_warehouse_analytics_role_privileges](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/grant_privileges_to_account_role) | resource |
| [snowflake_grant_privileges_to_account_role.grant_usage_operate_warehouse_dbt_role_privileges](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/grant_privileges_to_account_role) | resource |
| [snowflake_grant_privileges_to_account_role.grant_usage_operate_warehouse_query_role_privileges](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/grant_privileges_to_account_role) | resource |
| [snowflake_grant_privileges_to_account_role.grant_usage_schema_role_privileges](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/grant_privileges_to_account_role) | resource |
| [snowflake_role.roles](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/role) | resource |
| [snowflake_role_ownership_grant.grant_role_ownership](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/role_ownership_grant) | resource |
| [snowflake_schema.schema](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/schema) | resource |
| [snowflake_user.service_accounts](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/user) | resource |
| [snowflake_warehouse.warehouse](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/0.87.2/docs/resources/warehouse) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_all_privileges_to_role_on_all_future_schemas"></a> [all\_privileges\_to\_role\_on\_all\_future\_schemas](#input\_all\_privileges\_to\_role\_on\_all\_future\_schemas) | n/a | `set(string)` | n/a | yes |
| <a name="input_all_privileges_to_role_on_all_future_tables"></a> [all\_privileges\_to\_role\_on\_all\_future\_tables](#input\_all\_privileges\_to\_role\_on\_all\_future\_tables) | n/a | `set(string)` | n/a | yes |
| <a name="input_all_privileges_to_role_on_all_schemas"></a> [all\_privileges\_to\_role\_on\_all\_schemas](#input\_all\_privileges\_to\_role\_on\_all\_schemas) | n/a | `set(string)` | n/a | yes |
| <a name="input_all_privileges_to_role_on_all_tables"></a> [all\_privileges\_to\_role\_on\_all\_tables](#input\_all\_privileges\_to\_role\_on\_all\_tables) | n/a | `set(string)` | n/a | yes |
| <a name="input_all_privileges_to_role_on_db"></a> [all\_privileges\_to\_role\_on\_db](#input\_all\_privileges\_to\_role\_on\_db) | n/a | `set(string)` | n/a | yes |
| <a name="input_custom_roles"></a> [custom\_roles](#input\_custom\_roles) | n/a | <pre>list(object({<br>    name=string<br>    owner=string<br>  }))</pre> | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment | `string` | n/a | yes |
| <a name="input_project_slug"></a> [project\_slug](#input\_project\_slug) | Slug for the project with no special characters | `string` | n/a | yes |
| <a name="input_schemas"></a> [schemas](#input\_schemas) | List of schemas to be created in the project database | `list(string)` | n/a | yes |
| <a name="input_select_to_role_on_all_future_tables"></a> [select\_to\_role\_on\_all\_future\_tables](#input\_select\_to\_role\_on\_all\_future\_tables) | n/a | `set(string)` | n/a | yes |
| <a name="input_select_to_role_on_all_tables"></a> [select\_to\_role\_on\_all\_tables](#input\_select\_to\_role\_on\_all\_tables) | n/a | `set(string)` | n/a | yes |
| <a name="input_service_accounts"></a> [service\_accounts](#input\_service\_accounts) | n/a | <pre>list(object({<br>    user=string<br>    assigned_role=string<br>  }))</pre> | n/a | yes |
| <a name="input_snowflake_account"></a> [snowflake\_account](#input\_snowflake\_account) | Snowflake account | `string` | n/a | yes |
| <a name="input_upper_environment"></a> [upper\_environment](#input\_upper\_environment) | n/a | `string` | n/a | yes |
| <a name="input_upper_project"></a> [upper\_project](#input\_upper\_project) | n/a | `string` | n/a | yes |
| <a name="input_usage_operate_warehouse_adf"></a> [usage\_operate\_warehouse\_adf](#input\_usage\_operate\_warehouse\_adf) | n/a | `set(string)` | n/a | yes |
| <a name="input_usage_operate_warehouse_analytics"></a> [usage\_operate\_warehouse\_analytics](#input\_usage\_operate\_warehouse\_analytics) | n/a | `set(string)` | n/a | yes |
| <a name="input_usage_operate_warehouse_dbt"></a> [usage\_operate\_warehouse\_dbt](#input\_usage\_operate\_warehouse\_dbt) | n/a | `set(string)` | n/a | yes |
| <a name="input_usage_operate_warehouse_query"></a> [usage\_operate\_warehouse\_query](#input\_usage\_operate\_warehouse\_query) | n/a | `set(string)` | n/a | yes |
| <a name="input_usage_privileges_to_role_on_db"></a> [usage\_privileges\_to\_role\_on\_db](#input\_usage\_privileges\_to\_role\_on\_db) | n/a | `set(string)` | n/a | yes |
| <a name="input_usage_to_role_on_all_future_schemas"></a> [usage\_to\_role\_on\_all\_future\_schemas](#input\_usage\_to\_role\_on\_all\_future\_schemas) | n/a | `set(string)` | n/a | yes |
| <a name="input_usage_to_role_on_all_schemas"></a> [usage\_to\_role\_on\_all\_schemas](#input\_usage\_to\_role\_on\_all\_schemas) | n/a | `set(string)` | n/a | yes |
| <a name="input_warehouses"></a> [warehouses](#input\_warehouses) | n/a | <pre>list(object({<br>    name=string<br>    size=string<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->