provider "google" {
    project = var.project_id
    region  = var.region
    zone    = var.zone
}

resource "google_storage_bucket" "state-bucket" {
    name        = "joeshiett-tf-state-bucket"
    location    = "US"
    versioning {
        enabled = true
    }  
}

resource "google_compute_instance" "monitoring" {
    name            = "monitoring-server"
    machine_type    = "e2-medium"

    boot_disk {
        initialize_params {
            image   = var.image
        }
    }

    network_interface {
        network     = "default"
        access_config {

        }
    }
    tags = ["http-server", "zeitgeist-ports"]

}

resource "google_compute_instance" "logging" {
    name            = "logging-server"
    machine_type    = "e2-medium"

    boot_disk {
        initialize_params {
            image   = var.image
        }
    }

    network_interface {
        network     = "default"
        access_config {

        }
    }
    tags = ["http-server", "zeitgeist-ports"]
}

resource "google_compute_instance" "zeitgeist" {
    name            = "zeitgeist-node"
    machine_type    = "e2-standard-4"

    boot_disk {
        initialize_params {
            image   = var.image
            size = 50
        }
    }
    metadata_startup_script = file("${path.module}/zeitgeist.sh")

    network_interface {
        network     = "default"
        access_config {

        }
    }
    tags = ["http-server", "zeitgeist-ports"]
}

resource "google_compute_firewall" "http-server" {
    name        = "allow-http"
    network     = "default"

    allow {
        protocol = "tcp"
        ports = ["80"]
    }
    source_ranges   = ["0.0.0.0/0"]
    target_tags     = ["http-server"]         
}

resource "google_compute_firewall" "zeitgeist-ports" {
    name        = "allow-zeitgeist"
    network     = "default"

    allow {
        protocol = "tcp"
        ports = ["80", "1000-10000"]
    }
    source_ranges   = ["0.0.0.0/0"]
    target_tags     = ["zeitgeist-ports"]         
}

