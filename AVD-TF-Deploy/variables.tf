variable "resource_group_location" {
  default     = "eastus"
  description = "Location of the resource group."
}

variable "deploy_location" {
  default   = "westeurope"
  description = "region where the resources are deployed"
  
}

variable "resource_group_name" {
  default     = "kpmg-avd-pxcube-by-tf"
  description = "name of the resourcegroup"
}


variable "rdsh_count" {
  description = "Number of AVD machines to deploy"
  default     = 2
}

variable "prefix" {
  type        = string
  default     = "avdtf"
  description = "Prefix of the name of the AVD machine(s)"
}

variable "domain_name" {
  type        = string
  default     = "infra.local"
  description = "Name of the domain to join"
}

variable "domain_user_upn" {
  type        = string
  default     = "domainjoineruser" # do not include domain name as this is appended
  description = "Username for domain join (do not include domain name as this is appended)"
}

variable "domain_password" {
  type        = string
  default     = "ChangeMe123!"
  description = "Password of the user to authenticate with the domain"
  sensitive   = true
}

variable "vm_size" {
  description = "Size of the machine to deploy"
  default     = "Standard_DS2_v2"
}

variable "ou_path" {
  default = ""
}

variable "local_admin_username" {
  type        = string
  default     = "localadm"
  description = "local admin username"
}

variable "local_admin_password" {
  type        = string
  default     = "ChangeMe123!"
  description = "local admin password"
  sensitive   = true
}


###################### NETWORKING #############################


variable "dns_servers" {
  type        = list(string)
  default     = ["10.0.100.4", "10.0.100.5"]
  description = "Custom DNS configuration, AADDS"
}

variable "vnet_name" {
  type = string
  default = "vnet-pxcube"
  description = "Name of the pxcube vnet"
}

variable "vnet_range" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "Address range for deployment VNet"
}
variable "subnet_range_sessionhosts" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "Address range for session host subnet"
}

variable "subnet_range_AzureFirewallSubnet" {
  type        = list(string)
  default     = ["10.0.250.0/24"]
  description = "Address range for AzureFirewallSubnet"
}

variable "subnet_range_aadds" {
  type        = list(string)
  default     = ["10.0.100.0/24"]
  description = "Address range for Azure AD Domain Services"
}

variable "subnet_range_privateendpoints" {
  type        = list(string)
  default     = ["10.0.200.0/24"]
  description = "Address range for PrivateEndpoints"
}

####################### Shared Components #########################

variable "resource_group_management_name" {
  type        = string
  default     = "kpmg-avd-pxcube-mgmt-by-tf"
  description = "Name of the Resource group in which to deploy management resources"
}