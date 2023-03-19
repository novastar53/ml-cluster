# Jupyter Lab Server on AWS

This repository contains Terraform code to deploy a Jupyter Lab server on an AWS instance.

## Prerequisites

* An AWS account
* Terraform installed on your local machine

## Deployment

1. Clone this repository
2. Run `terraform init` to initialize the Terraform environment
3. Run `terraform apply` to deploy the infrastructure
4. Once the deployment is complete, you can access the Jupyter Lab server at the public IP address of the instance

## Cleanup

To delete the infrastructure, run `terraform destroy`.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
