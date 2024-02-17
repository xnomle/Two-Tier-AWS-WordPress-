resource "aws_eip" "eip" {
  count = 1  # Create two EIPs

  tags = {
    Name = "eip-${count.index}"
  }
}
