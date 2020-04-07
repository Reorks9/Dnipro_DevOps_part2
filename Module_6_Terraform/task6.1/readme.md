# Module 6 Terraform.

#### Homework: 
* Develop some minimal stack to deploy an infrastructure 
Acceptance Criteria:
* 1. Your stack has 5-7 resource types and relations between. Your stack has sense and value.
* 2. Task accepting format - Demo session starting with code review
* 3. Your stack is able to plan/apply/destroy successfully
* 4. We can see all activities in AWS Console in real time in parallel
* 5. Using remote state is preferable (but not mandatory)
* 6. English language is preferable (but not mandatory)


##### 5.1.1. Create VNet.

Create resource group "vnet_resource" and virtual network "vnet_for_hw".

![something going wrong](./images/image5.1.1_1.PNG)

Configure IP addresses range 10.2.0.0/16 and subinterfaces 10.2.10.0/24 and 10.2.20.0/24.

![something going wrong](./images/image5.1.1_2.PNG)

As a result we get:

![something going wrong](./images/image5.1.1_3.PNG)


##### 5.1.2. Create VM.

Create in the resource group "Resource1" virtial machine "TESTPC1" with connection to her through SSH.

![something going wrong](./images/image5.1.2_1.PNG)

Connect to out VM through SSH.

![something going wrong](./images/image5.1.2_2.PNG)


##### 5.1.3. Create Loadbalancer.

Create in resource group "Win" LoadBalancer "LB".<br>
In the other tabs, do not change anything. <br>
The numbers in the names of the created tools do not match, because the tools have already been created earlier and work correctly.

![something going wrong](./images/image5.1.3_1.PNG)

Create VM "Win2" in same region as LB. <br>
I could not choose "Size" at the moment, because there were no VM available in this region.

![something going wrong](./images/image5.1.3_2.PNG)

Configure network connections.

![something going wrong](./images/image5.1.3_3.PNG)

Configure LB on the same tab. <br>
Create server pool "pool_test2".

![something going wrong](./images/image5.1.3_4.PNG)

Connect to our VM "Win2". <br>
For install IIS in Power Shell run command <br>
    
    Install-WindowsFeature -name Web-Server -IncludeManagementTools

_________

Сontinue to configure LB. <br>
Create Health probes "Zond_test".

![something going wrong](./images/image5.1.3_5.PNG)

Create Load balancing rules "RuleforLB".

![something going wrong](./images/image5.1.3_6.PNG)

Check our configurations. <br>
Enter to IP VM (52.148.150.117) and IP LB (52.143.83.234).

![something going wrong](./images/image5.1.3_7.PNG)


##### 5.1.4. Create IIS server via Azure Portal.

Create VM and install IIS on this VM.

![something going wrong](./images/image5.1.4_1.PNG)


##### 5.2. Create IIS server via ARM template.

For deployment use next files: <br>
* template_for_IIS_original.json  
* parameters.json

![something going wrong](./images/image5.2.1_1.PNG)



##### 5.3. Change IIS default start page (ARM template or custom script).

For deployment use next files: <br>
* template_for_IIS_non_original.json  
* parameters.json

![something going wrong](./images/image5.3.1_1.PNG)


#### Links

    https://docs.microsoft.com/en-us/azure/load-balancer/tutorial-load-balancer-standard-manage-portal