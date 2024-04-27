tags = {
  "owner"   = "youremail@yourdomain.com"
  "service" = "my-app"
}

env_name       = "version-A1"
timeout        = "10m"
app_name       = "test-app-2"
solution_stack = "64bit Amazon Linux 2018.03 v2.9.3 running Ruby 2.6 (Puma)"

env_tags = {
  "environment" = "staging"
}

env_settings = {
  MinSize = {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = "1"
  }
  InstanceType = {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }
  MaxSize = {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = "1"
  }
  ENVIRONMENT_PROPERTY1 = {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "ENVIRONMENT_PROPERTY1"
    value     = "test:development"
  }
  ENVIRONMENT_PROPERTY2 = {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "ENVIRONMENT_PROPERTY2"
    value     = "transaction-broker"
  }
}
