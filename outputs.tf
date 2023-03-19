output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.jupyter.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.jupyter.public_ip
}

output "conn" {
  value = "ssh -i \"${aws_key_pair.generated_key.key_name}.pem\" ubuntu@${aws_instance.jupyter.public_dns}"
}
