This module is responsbile for creating a new environment in the transaction broker / presence applications during deployment time

Options for beanstalk environments are documented here: 
https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options-general.html

Example:
########### staging.tfvars

tags = {
  "owner"   = "yourmeail@yourdomain.com"
  "service" = "my-app"
}

service_name = "my-application"

my_app_env_name = "version-A"

my_app_timeout = "10m"

my_app_application = "plupu-test-app"

my_app_solution_stack = "64bit Amazon Linux 2018.03 v2.9.3 running Ruby 2.6 (Puma)"

env_tags = {
  "environment" = "staging"
}

my_app_env_settings = [
  [ "aws:elasticbeanstalk:application:environment", "BUNDLE_WITHOUT", "test:development"]
  ]
}
########### main tf

variable "my_app_env_name" {
  description = "EB environment name"
}

variable "my_app_application" {
  description = "EB application name"
}

variable "my_app_env_settings" {
  type        = "list"
  description = "A list of 3 item lists in the format env_settings = [ [namespace, name, value] ] for transaction broker"
}

variable "my_app_solution_stack" {
  description = "Solution stack for environment"
}

variable "my_app_timeout" {
  description = "EB environment deploy timeout"
}

variable "env_tags" {
  description = "Environment tags"
  type        = "map"
}

variable "tags" {
  type        = "map"
}

provider "aws" {
  region  = "us-west-2"
  profile = lookup(var.env_tags, "environment", "development")
  }

module "my_app-environment" {
  source          = "git::git@github.com/paul-lupu/tf-eb-environment.git"
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

###################
Then, run $ terraform apply  -var-file=staging.tfvars
