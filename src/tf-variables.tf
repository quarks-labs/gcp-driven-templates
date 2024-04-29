################################################################################
# APIS
################################################################################



variable "apis" {
  type = list(string)
}

variable "name" {
  type = string
}

variable "region" {
  type = string
}

variable "project" {
  type = string
}



################################################################################
# NETWORK
################################################################################


variable "subnetworks" {
  type = list(object({
    name                     = string
    region                   = string
    ip_cidr_range            = string
    private_ip_google_access = bool
    nat = object({
      nat_ip_allocate_option             = string
      source_subnetwork_ip_ranges_to_nat = string
    })
    secondary_ip_ranges = list(object({
      range_name    = string
      ip_cidr_range = string
    }))
  }))
}




################################################################################
# PEERING
################################################################################


variable "peering_networks" {
  type = list(object({
    peer_project                        = string
    peer_network                        = string
    import_custom_routes                = bool
    export_custom_routes                = bool
    import_subnet_routes_with_public_ip = bool
    export_subnet_routes_with_public_ip = bool
  }))
}



################################################################################
# GKE
################################################################################


variable "initial_node_count" {
  type = number
}

variable "default_max_pods_per_node" {
  type = number
}

variable "remove_default_node_pool" {
  type = bool
}

variable "enable_intranode_visibility" {
  type = bool
}

variable "enable_l4_ilb_subsetting" {
  type = bool
}

variable "enable_kubernetes_alpha" {
  type = bool
}

variable "enable_legacy_abac" {
  type = bool
}

variable "service_external_ips_config" {
  type = object({
    enabled = bool
  })
}

variable "master_auth" {
  type = object({
    client_certificate_config = object({
      issue_client_certificate = bool
    })
  })
}

variable "addons_config" {
  type = object({
    http_load_balancing = object({
      disable = bool
    })
    gce_persistent_disk_csi_driver_config = object({
      enabled = bool
    })
    network_policy_config = object({
      disabled = bool
    })
  })
}

variable "network_policy" {
  type = object({
    enabled  = bool
    provider = string
  })
}

variable "private_cluster_config" {
  type = object({
    enable_private_endpoint = bool
    enable_private_nodes    = bool
    master_ipv4_cidr_block  = string
    master_global_access_config = object({
      enabled = bool
    })
  })
}

variable "maintenance_policy" {
  type = object({
    daily_maintenance_window = object({
      start_time = string
    })
  })
}

################################################################################
# NODE POOL
################################################################################


variable "node_pools" {
  type = any
}
