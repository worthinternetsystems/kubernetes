resource "digitalocean_container_registry" "container-registry" {
  name                   = "worth-test-container-registry"
  subscription_tier_slug = "basic"
}

data "digitalocean_container_registry" "container-registry" {
  name = digitalocean_container_registry.container-registry.name
}

resource "digitalocean_container_registry_docker_credentials" "docker-credentials" {
  write         = true
  registry_name = digitalocean_container_registry.container-registry.name
}
data "digitalocean_kubernetes_versions" "example" {
}
resource "digitalocean_kubernetes_cluster" "cluster" {
  name    = "worth-test-kubernetes-cluster"
  region  = "ams3"
  version = data.digitalocean_kubernetes_versions.example.latest_version
  node_pool {
    name       = "worth-test-cluster-pool"
    size       = "s-1vcpu-2gb"
    auto_scale = true
    node_count = 1
    min_nodes  = 1
    max_nodes  = 5
  }
}


output "docker-credentials" {
  value     = digitalocean_container_registry_docker_credentials.docker-credentials.docker_credentials
  sensitive = true
}

output "docker-credentials-exp" {
  value = digitalocean_container_registry_docker_credentials.docker-credentials.credential_expiration_time
}


output "docker-container-registry" {
  value = digitalocean_container_registry.container-registry.endpoint
}

output "kubeconfig" {
  value     = digitalocean_kubernetes_cluster.cluster.kube_config[0]["raw_config"]
  sensitive = true
}

output "ip" {
  value = digitalocean_kubernetes_cluster.cluster.ipv4_address
}
