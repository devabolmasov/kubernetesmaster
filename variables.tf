variable "project" {}
variable "region" {}
variable "zone" {}
variable "kubernetes_master_name" {}
//variable "kubernetes_worker_name" {}
variable "vpc_name" {}
variable "vpc_subnetwork_name" {}
variable "subnet_cidr_block" {}
variable "machine_type" {}
variable "image" {}
variable "labels" {}
variable "k8_master_ssh_user" {}
variable "k8_master_ssh_pub_key_file" {}
// variable "k8_worker_ssh_user" {}
// variable "k8_worker_ssh_pub_key_file" {}
variable "firewall_ssh_rule" {}
variable "firewall_ssh_ports" {}
variable "firewall_ssh_range" {}
variable "firewall_http_rule" {}
variable "firewall_http_ports" {}
variable "firewall_http_range" {}