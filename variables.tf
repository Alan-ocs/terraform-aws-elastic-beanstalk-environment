variable "timeout" {
  description = "Deploy timeout" 
  default     = "20m"
}

variable "env_settings" {
  type        = "list"
  description = "A list of 3 item lists in the format env_settings = [ [namespace, name, value] ]"
  default     = [ 
    [ "aws:elasticbeanstalk:application:environment", "BUNDLE_WITHOUT", "test:development"]
  ]
}

variable "app_name" { 
  description = "The name of the application to which to attach the environment"
}

variable "env_name" {
  description = "Name for elastic beanstalk environment"
}

variable "solution_stack" {
  description = "Elastic beanstalk environment solution stack"
}

variable "tags" { 
  type        = "map"
}
