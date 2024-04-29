provider "helm" {
  kubernetes {
    host                   = "https://${module.gke.endpoint}"
    token                  = data.google_client_config.provider.access_token
    cluster_ca_certificate = base64decode(module.gke.master_auth[0].cluster_ca_certificate)
  }
}

/*

resource "helm_release" "ingress-nginx" {

  name             = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  force_update     = true
  cleanup_on_fail  = true
  create_namespace = true
  wait             = true
  timeout          = 30000

  values = [
    # "${file("./helms/ingress-nginx/values.yaml")}",
  ]

  depends_on = [
    module.gke,
  ]
}

*/