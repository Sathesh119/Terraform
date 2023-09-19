
#Create a VPC
resource "aws_vpc" "Custom_vpc" {
  cidr_block = "10.0.0.0/16"


}
#2 Create a public subnet
resource "aws_subnet" "Public_Subnet" {
  vpc_id            = aws_vpc.Custom_vpc.id
  availability_zone = "ap-northeast-1a"
  cidr_block        = "10.0.1.0/24"

}

#3  Create a private subnet
resource "aws_subnet" "Private_Subnet" {
  vpc_id            = aws_vpc.Custom_vpc.id
  availability_zone = "ap-northeast-1c"
  cidr_block        = "10.0.2.0/24"

}

#4 Create a IGW
resource "aws_internet_gateway" "My_IGW" {
  vpc_id = aws_vpc.Custom_vpc.id

}
#5 Create a route table
resource "aws_route_table" "Custom_RT" {
  vpc_id = aws_vpc.Custom_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.My_IGW.id
  }
}

#6 Create RT association
resource "aws_route_table_association" "PublicRTassociation" {
  subnet_id      = aws_subnet.Public_Subnet.id
  route_table_id = aws_route_table.Custom_RT.id

}
