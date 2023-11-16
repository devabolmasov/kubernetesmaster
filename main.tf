terraform {
 backend "gcs" {
   bucket  = "itoutposts"
   prefix  = "terraform/state/kubernetes_vm"
 }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

// Master node for k8s cluster
resource "google_compute_instance" "kubernetes_master" {
  name         = var.kubernetes_master_name
  machine_type = var.machine_type

  labels = var.labels

  boot_disk {
    initialize_params {
      image = var.image
    }
  
  }

  metadata = {
    "ssh-keys" = <<EOF
      ${var.k8_master_ssh_user}:${file(var.k8_master_ssh_pub_key_file)}
      pavlo:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHE82IFNxB6rNtgr8vgvcwHg6buELdcmx3zAwJZEdEly pavlo@pavlos-MacBook-Pro.local
    EOF
  }
    
    metadata_startup_script = <<-EOF
      #!/bin/bash
      sudo apt update -y && sudo apt upgrade
      sudo hostnamectl set-hostname "k8master.test.com"
  EOF

  network_interface {

    network = google_compute_network.vpc_network.self_link
    subnetwork = google_compute_subnetwork.vpc_subnetwork.self_link
    access_config {
    }
  }
}

// Worker node for k8s cluster
resource "google_compute_instance" "kubernetes_worker" {
  name         = var.kubernetes_worker_name
  machine_type = var.machine_type

  labels = var.labels

  boot_disk {
    initialize_params {
      image = var.image
    }
  
  }

  metadata = {
    "ssh-keys" = <<EOF
      ${var.k8_worker_ssh_user}:${file(var.k8_worker_ssh_pub_key_file)}
    EOF
  }
    
    metadata_startup_script = <<-EOF
      #!/bin/bash
      sudo apt update -y && sudo apt upgrade
      sudo hostnamectl set-hostname "k8worker.test.com"
  EOF

  network_interface {

    network = google_compute_network.vpc_network.self_link
    subnetwork = google_compute_subnetwork.vpc_subnetwork.self_link
    access_config {
    }
  }
}

