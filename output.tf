output "ec2_public_ip" {
  description = "The public IP address of the web server"
  value       = aws_instance.web.public_ip
}

output "ec2_instance_id" {
  description = "The ID of the provisioned EC2 instance"
  value       = aws_instance.web.id
}

output "ec2_instance_dns" {
  description = "The public DNS of the provisioned EC2 instance"
  value       = aws_instance.web.public_dns
}