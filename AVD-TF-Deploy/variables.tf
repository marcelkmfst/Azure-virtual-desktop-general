variable "resource_group_location" {
  default     = "westeurope"
  description = "Location of the resource group."
}

variable "rg_name" {
  type        = string
  default     = "RG-KPMG-PXCube"
  description = "Name of the Resource group in which to deploy service objects"
}

variable "workspace" {
  type        = string
  description = "Name of the Azure Virtual Desktop workspace"
  default     = "AVD PXCube Workspace"
}

variable "hostpool" {
  type        = string
  description = "Name of the Azure Virtual Desktop host pool"
  default     = "AVD-HP-PXCUBE"
}

variable "rfc3339" {
  type        = string
  default     = "2022-03-30T12:43:13Z"
  description = "Registration token expiration"
}

variable "prefix" {
  type        = string
  default     = "pxcubeavd"
  description = "Prefix of the name of the AVD machine(s)"
}

variable "desktop-app-group" {
  type        = string
  default     = "PXCube Desktop"
  description = "Name of the Desktop App Group"
}