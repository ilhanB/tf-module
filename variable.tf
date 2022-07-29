variable "ec2-name" {
  default = "ec2-ilhan"
}
variable "ec2_type" {
  default = "t2.micro"
}
variable "ec2_ami" {
  default = "ami-0c02fb55956c7d316"
}
variable "s3_bucket_name" {
  default = "ilhan-s3-bucket-variable-123"
}
variable "key_name" {
  default = "firstkey"
}
variable "aws_security_group" {
  default = "web-sec-gr"
}
