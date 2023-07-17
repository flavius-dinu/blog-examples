terraform {
  source = "./"
}

inputs = {
  vpc_id = dependency.config1.outputs.vpc_id
}

dependency "config1" {
  config_path  = "../config1"
  skip_outputs = true
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "terragrunt-spacelift-state"
    key            = "config2/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "spacelift-terragrunt-dynamodb"
  }
}