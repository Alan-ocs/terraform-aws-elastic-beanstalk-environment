variable "my_app_env_name" {
  description = "EB environment name"
  type        = string
}

variable "my_app_application" {
  description = "EB application name"
  type        = string
}

variable "my_app_env_settings" {
  description = "A list of environment settings for transaction broker"
  type        = list(object({
    namespace = string
    name      = string
    value     = string
  }))
}

variable "my_app_solution_stack" {
  description = "Solution stack for environment"
  type        = string
}

variable "my_app_timeout" {
  description = "EB environment deploy timeout"
  type        = string
}

variable "env_tags" {
  description = "Environment tags"
  type        = map(string)
}

variable "tags" {
  description = "Common tags for resources"
  type        = map(string)
}

provider "aws" {
  region  = "us-west-2"
  profile = var.env_tags["environment"]
}

module "my_app_environment" {
  source          = "github.com/paul-lupu/tf-eb-environment.git"
  env_name        = var.my_app_env_name
  app_name        = var.my_app_application
  solution_stack  = var.my_app_solution_stack
  timeout         = var.my_app_timeout
  env_settings    = var.my_app_env_settings
  tags            = local.tags
}

locals {
  tags = merge(var.tags, var.env_tags)
}
