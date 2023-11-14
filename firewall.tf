resource "google_compute_firewall" "allow-ssh" {
  project = var.project
  name    = var.firewall_ssh_rule
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = var.firewall_ssh_ports
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = var.firewall_ssh_range # Allow SSH access from any IP address (for demonstration purposes, you may want to restrict this to a specific IP range)
}

resource "google_compute_firewall" "allow-http-https" {
  name    = var.firewall_http_rule
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = var.firewall_http_ports
  }
  

  source_ranges = var.firewall_http_range # Allow HTTP access from any IP address (for demonstration purposes, you may want to restrict this to a specific IP range)
}
