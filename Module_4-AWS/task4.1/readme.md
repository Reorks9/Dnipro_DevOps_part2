# Module 4 AWS.

#### Homewok: 
* 1. Create a new VPC
* 2. Create a public and a private subnet
* 3. Start a new EC2 instance
* 4. Deploy an ACL and a security group
* 5. Set up VPC peering
* Не стесняйтесь запускать EC2 micro instances в вашей новой VPC. Сделаете домашнее задание - обязательно остановите EC2 instances


##### 1. Create a new VPC (10.0.0.0/16)

![something going wrong](https://user-images.githubusercontent.com/22638433/76379887-09275300-635a-11ea-8344-d34fa74f74f3.PNG)


##### 2. Create a public and a private subnet
Create private subnet (10.0.1.0/24):

![something going wrong](https://user-images.githubusercontent.com/22638433/76379889-09bfe980-635a-11ea-9461-434d0a9549aa.PNG)

Create public subnet (10.0.0.0/24)::

![something going wrong](https://user-images.githubusercontent.com/22638433/76379890-0a588000-635a-11ea-9dd8-71bf2e41ddba.PNG)

Create internet gateway:

![something going wrong](https://user-images.githubusercontent.com/22638433/76379892-0a588000-635a-11ea-807f-000226b3f0f7.PNG)

Edit subnet assotiation for private subnet:

![something going wrong](https://user-images.githubusercontent.com/22638433/76379893-0af11680-635a-11ea-8fff-12336b0151f0.PNG)

Create new route table for public subnet:

![something going wrong](https://user-images.githubusercontent.com/22638433/76379895-0af11680-635a-11ea-876c-a2ac1f6cb253.PNG)

Edit subnet assotiation for public subnet:

![something going wrong](https://user-images.githubusercontent.com/22638433/76379896-0b89ad00-635a-11ea-9f7a-ebf3daaf8a38.PNG)

Attach internet gateway to our VPC (vpc_test):

![something going wrong](https://user-images.githubusercontent.com/22638433/76379899-0b89ad00-635a-11ea-9060-f0b259cb3b92.PNG)

Add inernet gateway to Routes "rout table_test", which we created for public subnet:

![something going wrong](https://user-images.githubusercontent.com/22638433/76379901-0c224380-635a-11ea-951a-1119f14435f3.PNG)

Create NAT gateway for private subnet (with Elastic IP):

![something going wrong](https://user-images.githubusercontent.com/22638433/76379902-0c224380-635a-11ea-99a2-efde18f01d4b.PNG)

Add NAT gateway to Routes "default table_test", which was created for private subnet:

![something going wrong](https://user-images.githubusercontent.com/22638433/76379903-0cbada00-635a-11ea-9800-02ffab5eb985.PNG)


##### 3-4. Start a new EC2 instance. Deploy an ACL and a security group

Create security group for instance "test for public" with inbound rules:

![something going wrong](https://user-images.githubusercontent.com/22638433/76379904-0cbada00-635a-11ea-8838-b208a426e8fb.PNG)

Create instance "test for public" (subnet 10.0.0.0/24):

![something going wrong](https://user-images.githubusercontent.com/22638433/76379907-0d537080-635a-11ea-9de4-2ba97db78397.PNG)

Create instance "test for private" (subnet 10.0.1.0/24):

![something going wrong](https://user-images.githubusercontent.com/22638433/76379908-0d537080-635a-11ea-83a4-9f2922fbfc9c.PNG)