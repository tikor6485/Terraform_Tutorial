vpc_cidr_block       = "10.0.0.0/16"
subet_cidr_block     = "10.0.10.0/24"
avail_zone           = "us-east-1b"
env_prefix           = "dev"
my_ip                = "192.168.0.0/24" # The IP is from this website: https://www.whatsmyip.org/
ami_id               = "ami-0aa7d40eeae50c9a9"
instance_type        = "t2.micro"
public_key_location  = "/home/tirdad/.ssh/id_rsa.pub"
private_key_location = "/home/tirdad/.ssh/id_rsa"