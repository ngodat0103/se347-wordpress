resource "google_compute_firewall" "allow_http_https" {
  name    = "allow-http-https-${var.network}"
  network = var.network
  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }


  source_ranges=["0.0.0.0/0"]
  # Apply the firewall rule to instances by using the same tags
  target_tags = var.target_tags

  # Optional: description for the rule
  description = "Allow HTTP and HTTPS traffic to instances"
}