
resource "aws_instance" "app_server" {
  ami = "ami-0a2e10c1b874595a1"

  instance_type = "t2.micro"
  subnet_id     = "subnet-0f1df9507bbcef90a"
  tags = {
    Name = "Terraform_Demo"
  }
}
resource "aws_ebs_volume" "ebsvol" {

  availability_zone = "ap-northeast-1a"
  size              = 1

  tags = {
    Name = "HelloWorld"
  }
}
resource "aws_volume_attachment" "ebs_attach" {
  instance_id = aws_instance.app_server.id
  volume_id   = aws_ebs_volume.ebsvol.id
  device_name = "/dev/sdh"
}
