variable "timeout" {
  description = "Deploy timeout"
  type        = string
  default     = "20m"
}

variable "env_settings" {
  description = "A map of environment settings"
  type        = map(object({
    namespace = string
    name      = string
    value     = string
  }))
  default     = {
    BUNDLE_WITHOUT = {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = "BUNDLE_WITHOUT"
      value     = "test:development"
    }
  }
}

variable "app_name" {
  description = "The name of the application to which to attach the environment"
  type        = string
}

variable "env_name" {
  description = "Name for elastic beanstalk environment"
  type        = string
}

variable "solution_stack" {
  description = "Elastic beanstalk environment solution stack"
  type        = string
}

variable "tags" {
  description = "A map of tags"
  type        = map(string)
}
