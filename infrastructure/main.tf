provider "google" {
  project = "<YOUR_PROJECT_ID>"
  region  = "us-central1"
}

resource "google_kubernetes_cluster" "primary" {
  name     = "primary-cluster"
  location = "us-central1-a"

  initial_node_count = 1

  master_auth {
    username = "admin"
    password = "password" # Use a secure method for passwords
  }
}

resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "nextjs-frontend"
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "nextjs-frontend"
      }
    }

    template {
      metadata {
        labels = {
          app = "nextjs-frontend"
        }
      }

      spec {
        container {
          name  = "nextjs-frontend"
          image = "your-dockerhub-username/nextjs-frontend:latest"
          ports {
            container_port = 3000
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "backend" {
  metadata {
    name = "fastify-backend"
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "fastify-backend"
      }
    }

    template {
      metadata {
        labels = {
          app = "fastify-backend"
        }
      }

      spec {
        container {
          name  = "fastify-backend"
          image = "your-dockerhub-username/fastify-backend:latest"
          ports {
            container_port = 3001
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "frontend" {
  metadata {
    name = "frontend-service"
  }

  spec {
    selector = {
      app = "nextjs-frontend"
    }
    port {
      port     = 80
      target_port = 3000
    }
    type = "LoadBalancer"
  }
}

resource "kubernetes_service" "backend" {
  metadata {
    name = "backend-service"
  }

  spec {
    selector = {
      app = "fastify-backend"
    }
    port {
      port     = 80
      target_port = 3001
    }
    type = "ClusterIP"
  }
}
