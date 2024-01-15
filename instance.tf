resource "aws_key_pair" "project-key" {
  key_name   = "master_key"
  public_key = file("master_key.pub")
}

resource "aws_instance" "test-instance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.project-key.key_name
  vpc_security_group_ids = ["sg-0b46c47eefb57e4c7"]
  tags = {
    name    = "Finance_Website"
    project = "Finance"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("master_key")
    host        = self.public_ip

  }
}
