output "connection_command" {
  description = "Command to connect to the Kubernetes cluster"
  value       = "ssh -i ${var.ssh_private_key_path} ${var.ssh_username}@${var.ssh_host} -p ${var.ssh_port}"
}

output "kubectl_command" {
  description = "Command to access the KIND cluster after connecting via SSH"
  value       = "kubectl --context kind-elunic-challenge"
} 
