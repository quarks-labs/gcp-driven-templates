

module "network_peering_left" {
  source   = "git::git@github.com:quarks-labs/gcp-network-peering-module.git"
  for_each = { for idx, peering in var.peering_networks : idx => peering }

  name         = "${var.project}-to-${each.value.peer_project}"
  network      = "projects/${var.project}/global/networks/${module.network.network_name}"
  peer_network = "projects/${each.value.peer_project}/global/networks/${each.value.peer_network}"

  import_custom_routes = try(each.value.import_custom_routes, false)
  export_custom_routes = try(each.value.export_custom_routes, false)

  import_subnet_routes_with_public_ip = try(each.value.import_subnet_routes_with_public_ip, false)
  export_subnet_routes_with_public_ip = try(each.value.export_subnet_routes_with_public_ip, false)

  depends_on = [
    module.network
  ]
}

module "network_peering_right" {
  source   = "git::git@github.com:quarks-labs/gcp-network-peering-module.git"
  for_each = { for idx, peering in var.peering_networks : idx => peering }

  name         = "${each.value.peer_project}-to-${var.project}"
  network      = "projects/${each.value.peer_project}/global/networks/${each.value.peer_network}"
  peer_network = "projects/${var.project}/global/networks/${module.network.network_name}"

  import_custom_routes                = try(each.value.import_custom_routes, false)
  export_custom_routes                = try(each.value.export_custom_routes, false)
  import_subnet_routes_with_public_ip = try(each.value.import_subnet_routes_with_public_ip, false)
  export_subnet_routes_with_public_ip = try(each.value.import_subnet_routes_with_public_ip, false)
  
  depends_on = [
    module.network,
    google_project_service.api
  ]
}
  
