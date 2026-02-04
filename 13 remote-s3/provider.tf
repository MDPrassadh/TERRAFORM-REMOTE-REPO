terraform {
  required_version = ">1.3.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.28.0"
    }
  }
  backend "s3" {
    bucket = "81s-locking-s3"
    key = "prassadh-s3-lock"
    region = "us-east-1"
    #use_lockfile = true
    dynamodb_table = "tf.statelock"
    
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

# Solo vs Team Workflows

# Question: “Why use DynamoDB locking instead of use_lockfile = true?”

# Answer: use_lockfile works fine for solo use, but in team environments DynamoDB is safer because it enforces distributed locks across multiple users. With lockfile, two users could still collide if they bypass the lock.


# create bucket

# aws s3api create-bucket \
#   --bucket 81s-remote-state-file \
#   --region us-east-1

# aws s3api put-bucket-versioning \
#   --bucket 81s-locking \
#   --versioning-configuration Status=Enabled
