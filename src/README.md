## Requirements   

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 5.24.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.8.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.16.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.24.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_database_instance"></a> [database\_instance](#module\_database\_instance) | git::git@github.com:quarks-labs/gcp-sql-database-instance-module.git | n/a |
| <a name="module_gke"></a> [gke](#module\_gke) | git::git@github.com:quarks-labs/gcp-container-cluster-module.git 
| n/a |
| <a name="module_module"></a> [module](#module\_module) | git::git@github.com:quarks-labs/gcp-redis-instance-module.git | n/a |
| <a name="module_network"></a> [network](#module\_network) | git::git@github.com:quarks-labs/gcp-network-module.git | n/a |
| <a name="module_network_peering_left"></a> [network\_peering\_left](#module\_network\_peering\_left) | git::git@github.com:quarks-labs/gcp-network-peering-module.git | n/a |
| <a name="module_network_peering_right"></a> [network\_peering\_right](#module\_network\_peering\_right) | git::git@github.com:quarks-labs/gcp-network-peering-module.git | n/a |
| <a name="module_pubsub"></a> [pubsub](#module\_pubsub) | git::git@github.com:quarks-labs/gcp-pubsub-module.git | 
n/a |
| <a name="module_spanner"></a> [spanner](#module\_spanner) | git::git@github.com:quarks-labs/gcp-spanner-instance-module.git | n/a |

## Resources

| Name | Type |
|------|------|
| [google_project_service.api](https://registry.terraform.io/providers/hashicorp/google/5.24.0/docs/resources/project_service) | resource |
| [random_string.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [google_client_config.provider](https://registry.terraform.io/providers/hashicorp/google/5.24.0/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addons_config"></a> [addons\_config](#input\_addons\_config) | n/a | <pre>object({<br>    http_load_balancing = object({<br>      disable = bool<br>    })<br>    gce_persistent_disk_csi_driver_config = object({<br>      enabled = bool<br>    })<br>    network_policy_config = object({<br>      disabled = bool<br>    })<br>  })</pre> | n/a | yes |
| <a name="input_apis"></a> [apis](#input\_apis) | n/a | `list(string)` | n/a | yes |
| <a name="input_default_max_pods_per_node"></a> [default\_max\_pods\_per\_node](#input\_default\_max\_pods\_per\_node) | n/a | `number` | n/a | yes |
| <a name="input_enable_intranode_visibility"></a> [enable\_intranode\_visibility](#input\_enable\_intranode\_visibility) | n/a | `bool` | n/a | yes |
| <a name="input_enable_kubernetes_alpha"></a> [enable\_kubernetes\_alpha](#input\_enable\_kubernetes\_alpha) | n/a | `bool` | n/a | yes |
| <a name="input_enable_l4_ilb_subsetting"></a> [enable\_l4\_ilb\_subsetting](#input\_enable\_l4\_ilb\_subsetting) 
| n/a | `bool` | n/a | yes |
| <a name="input_enable_legacy_abac"></a> [enable\_legacy\_abac](#input\_enable\_legacy\_abac) | n/a | `bool` | n/a | yes |
| <a name="input_initial_node_count"></a> [initial\_node\_count](#input\_initial\_node\_count) | n/a | `number` | n/a | yes |
| <a name="input_maintenance_policy"></a> [maintenance\_policy](#input\_maintenance\_policy) | n/a | <pre>object({<br>    daily_maintenance_window = object({<br>      start_time = string<br>    })<br>  })</pre> | n/a | yes |      
| <a name="input_master_auth"></a> [master\_auth](#input\_master\_auth) | n/a | <pre>object({<br>    client_certificate_config = object({<br>      issue_client_certificate = bool<br>    })<br>  })</pre> | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | n/a | <pre>object({<br>    enabled  = bool<br>    provider = string<br>  })</pre> | n/a | yes |
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | n/a | `any` | n/a | yes |
| <a name="input_peering_networks"></a> [peering\_networks](#input\_peering\_networks) | n/a | <pre>list(object({<br>    peer_project                        = string<br>    peer_network                        = string<br>    import_custom_routes                = bool<br>    export_custom_routes                = bool<br>    import_subnet_routes_with_public_ip = bool<br>    export_subnet_routes_with_public_ip = bool<br>  }))</pre> | n/a | yes |
| <a name="input_private_cluster_config"></a> [private\_cluster\_config](#input\_private\_cluster\_config) | n/a | 
<pre>object({<br>    enable_private_endpoint = bool<br>    enable_private_nodes    = bool<br>    master_ipv4_cidr_block  = string<br>    master_global_access_config = object({<br>      enabled = bool<br>    })<br>  })</pre> | n/a 
| yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_remove_default_node_pool"></a> [remove\_default\_node\_pool](#input\_remove\_default\_node\_pool) 
| n/a | `bool` | n/a | yes |
| <a name="input_service_external_ips_config"></a> [service\_external\_ips\_config](#input\_service\_external\_ips\_config) | n/a | <pre>object({<br>    enabled = bool<br>  })</pre> | n/a | yes |
| <a name="input_subnetworks"></a> [subnetworks](#input\_subnetworks) | n/a | <pre>list(object({<br>    name       
              = string<br>    region                   = string<br>    ip_cidr_range            = string<br>    private_ip_google_access = bool<br>    nat = object({<br>      nat_ip_allocate_option             = string<br>      source_subnetwork_ip_ranges_to_nat = string<br>    })<br>    secondary_ip_ranges = list(object({<br>      range_name 
   = string<br>      ip_cidr_range = string<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.