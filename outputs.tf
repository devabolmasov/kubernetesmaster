output "master_private_ip" {
    value = google_compute_instance.kubernetes_master.network_interface.0.network_ip
}

output "master_public_ip" {
    value = google_compute_instance.kubernetes_master.network_interface.0.access_config.0.nat_ip
}

/*
output "worker_private_ip" {
    value = google_compute_instance.kubernetes_worker.network_interface.0.network_ip
}

output "worker_public_ip" {
    value = google_compute_instance.kubernetes_worker.network_interface.0.access_config.0.nat_ip
}
*/