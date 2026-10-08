resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y nginx
              systemctl enable nginx
              systemctl start nginx
              echo "<h1>Terraform AWS DevOps Project</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name        = "terraform-web-server"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}
