variable "ssh_username" {
  description = "Username for SSH access to the remote server"
  type        = string
}

variable "ssh_private_key_path" {
  description = "Path to the SSH private key file for authentication"
  type        = string
}

variable "ssh_host" {
  description = "Hostname or IP address of the remote server"
  type        = string
}

variable "ssh_port" {
  description = "SSH port number for the remote server"
  type        = number
  default     = 22
} 
