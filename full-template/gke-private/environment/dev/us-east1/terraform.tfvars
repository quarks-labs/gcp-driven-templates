
################################################################################
# GLOBAL
################################################################################

name    = "quarks-labs"
project = "quarks-labs"
region  = "us-east1"

################################################################################
# APIS GKE
################################################################################


apis = [
  "gkeconnect.googleapis.com",
  "container.googleapis.com",
  "containerregistry.googleapis.com",
  "binaryauthorization.googleapis.com"
]

################################################################################
# GKE
################################################################################

initial_node_count          = 1
default_max_pods_per_node   = 110
remove_default_node_pool    = true
enable_intranode_visibility = false
enable_l4_ilb_subsetting    = true
enable_kubernetes_alpha     = false
enable_legacy_abac          = true
master_auth = {
  client_certificate_config = {
    issue_client_certificate = true
  }
}
service_external_ips_config = {
  enabled = true
}
network_policy = {
  enabled  = true
  provider = "CALICO"
}
addons_config = {
  http_load_balancing = {
    disable = false
  }
  gce_persistent_disk_csi_driver_config = {
    enabled = true
  }
  network_policy_config = {
    disabled = false
  }
}
private_cluster_config = {
  enable_private_endpoint = false
  enable_private_nodes    = true
  master_ipv4_cidr_block  = "172.0.0.0/28"
  master_global_access_config = {
    enabled = true
  }
}

maintenance_policy = {
  daily_maintenance_window = {
    start_time = "03:00"
  }
}



################################################################################
# NETWORK SETTINGS
################################################################################

subnetworks = [{
  name                     = "default-01"
  region                   = "us-east1"
  ip_cidr_range            = "172.28.0.0/27"
  private_ip_google_access = false
  nat = {
    nat_ip_allocate_option             = "MANUAL_ONLY"
    source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  }
  secondary_ip_ranges = [{
    range_name    = "primary"
    ip_cidr_range = "172.1.16.0/20"
    },
    {
      range_name    = "secondary"
      ip_cidr_range = "172.1.32.0/20"
  }]
  }
]

################################################################################
# VPC PEERING
################################################################################


peering_networks = [
  {
    peer_project                        = "quarks-labs"
    peer_network                        = "quarks-labs"
    import_custom_routes                = true
    export_custom_routes                = true
    import_subnet_routes_with_public_ip = true
    export_subnet_routes_with_public_ip = true
  }
]


################################################################################
# NODE POOL SETTINGS
################################################################################

node_pools = [{
  name       = "node-pool-01"
  node_count = 1
  autoscaling = {
    total_min_node_count = 1
    total_max_node_count = 1
    location_policy      = "BALANCED"
  }
  node_config = {
    machine_type = "n1-standard-1"
    disk_type    = "pd-ssd"
    disk_size_gb = 20
    preemptible  = false
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    tags     = []
    metadata = {}
    labels   = {}
  }
  timeouts = {
    create = "30m"
    update = "30m"
  }
}]


