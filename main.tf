provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami          ="ami-0ec10929233384c7f"
  instance_type = "t3.micro"

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install apache2 -y
              systemctl start apache2
              echo "Hello from Jenkins" > /var/www/html/index.html
              EOF
}
