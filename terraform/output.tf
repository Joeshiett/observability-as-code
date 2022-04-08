output "monitoring-ip" {
  value = google_compute_instance.monitoring.network_interface.0.access_config.0.nat_ip
}

output "logging-ip" {
  value = google_compute_instance.logging.network_interface.0.access_config.0.nat_ip
}

output "zeitgeist-ip" {
  value = google_compute_instance.zeitgeist.network_interface.0.access_config.0.nat_ip
}