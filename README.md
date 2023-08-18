# terraform-webserver-balancee
This guide is to demonstrated how to deploy a basic "Hello World" web application to AWS using Terraform and EC2 instances.

Deployment Steps
Clone or Create a Project Directory: {mkdir balancee}
Create a new directory for your project and navigate to it in your terminal. {mkdir module}

Create a New File (main.tf) {vim main.tf}

main.tf is the primary Terraform configuration file where you define the infrastructure resources you want to create or manage. It contains the resource definitions, variables, providers, data sources, and other components necessary to describe your infrastructure.

Create a New File (var.tf) {vim var.tf}

variable.tf is used to define input variables that is used throughout your Terraform configuration. Variables allow you to parameterize your configurations, making them more flexible and reusable. You can define variables for values that might change across environments or deployments, like instance sizes, counts, or strings

Create  New Files (prod.tfvars, staging.tfvars, dev.tfvars) {vim prod.tfvars staging.tfvars dev.tfvars}

.tfvars files are used to assign values to the variables defined in your configuration files. They allow you to separate variable values from the code itself, making it easier to manage and maintain different configurations for different environments or scenarios. You can create multiple .tfvars files, each containing values specific to a particular environment or configuration.
{Three different environment were created so the main.tf configuration file can be used to deploy in various environment created}

Create a New File (providers.tf) {vim providers.tf}

providers.tf is used to configure and define the providers you're using in your Terraform project. Providers are responsible for interacting with various cloud platforms or services, like AWS, Azure, or Google Cloud. In providers.tf, you define which provider you're using, configure authentication details, and set any other provider-specific settings.

on the terraform cli
create infrastructure
terraform init
terraform plan 
terraform apply -auto-

clean up 
terraform destroy -auto-approve

clean
