# Module 7 Cloud Formation.

#### Homework: 
Create a yaml file which describes AWS stack to deploy (could be taken from Terraform task). <br>
Acceptance Criteria:
* Stack has at least one parameter with default value, with "Allowed values" option and Output.
* Task accepting format - Demo session starting with code review
* Your stack is able to be deployed and deleted successfully
* We can see all activities in AWS CF Console in real time in parallel
* We can check the Output value(s) in AWS Console
* English language is preferable (but not mandatory)


##### 7.1.1. Terraform installation.

    sudo apt-get install unzip

Confirm the latest version number on the terraform website: <br>

    https://releases.hashicorp.com/terraform/

or <br>

    https://www.terraform.io/downloads.html

    wget https://releases.hashicorp.com/terraform/0.12.18/terraform_0.12.18_linux_amd64.zip
    unzip terraform_0.12.18_linux_amd64.zip
    sudo mv terraform /usr/local/bin/
    terraform -v

The main is copy file "terraform" to /usr/local/bin.

##### 6.1.2. Terraform running.

Add AWS keys as environment variables (in terminal).

    export AWS_ACCESS_KEY=Your_AWS_ACCESS_KEY
    export AWS_SECRET_KEY=Your_AWS_SECRET_KEY

In work directory run next commands: <br>
Install needed plugins.

    terraform init

Check errors on terafform file.

    terraform validate

Run terraform file.

    terraform apply -auto-approve

-auto-approve # to run without confirmation <br>

Check for changes

    terraform plan

After that, 2 Instances will be launched at the AWS. Also will be launched VPC, subnet, LB and other. <br>
In terminal we see LB IP address.

![something going wrong](./images/image6.1.1.PNG)

Go to the LB address (the address is displayed in the terminal)

![something going wrong](./images/image6.1.2.PNG)

Removal of installed resources from AWS

    terraform destroy -auto-approve
