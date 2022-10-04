provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}
resource "aws_instance" "weblinux" {
  ami           = var.ami
  instance_type = var.instance_type

}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"
  size              = 1
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.weblinux.id
}
