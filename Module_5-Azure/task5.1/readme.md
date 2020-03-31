# Module 5 Azure.

#### Homework: 
* 1. Create VNet, VM, Loadbalancer, IIS server via Azure Portal.
* 2. Create IIS server via ARM template.
* 3. Change IIS default start page (ARM template or custom script).


##### 5.1.1. Create VNet.

Create resource group "vnet_resource" and virtual network "vnet_for_hw".
![something going wrong](https://user-images.githubusercontent.com/22638433/76379887-09275300-635a-11ea-8344-d34fa74f74f3.PN)

Configure IP addresses range 10.2.0.0/16 and subinterfaces 10.2.10.0/24 and 10.2.20.0/24.
![something going wrong](https://user-images.githubusercontent.com/22638433/76379887-09275300-635a-11ea-8344-d34fa74f74f3.PN)

As a result we get:
![something going wrong](https://user-images.githubusercontent.com/22638433/76379887-09275300-635a-11ea-8344-d34fa74f74f3.PN)


##### 5.1.2. Create VM.

Create in the resource group "Resource1" virtial machine "TESTPC1" with connection to her through SSH.
![something going wrong](https://user-images.githubusercontent.com/22638433/76379887-09275300-635a-11ea-8344-d34fa74f74f3.PN)

Connect to out VM through SSH.
![something going wrong](https://user-images.githubusercontent.com/22638433/76379887-09275300-635a-11ea-8344-d34fa74f74f3.PN)


##### 5.1.3. Create Loadbalancer.

Create in resource group "Win" LoadBalancer "LB".<br>
In the other tabs, do not change anything. <br>
The numbers in the names of the created tools do not match, because the tools have already been created earlier and work correctly. <br>
![something going wrong](https://user-images.githubusercontent.com/22638433/77929543-74f24100-72b2-11ea-9e23-d4b796afd2f5.PNG)

Create VM "Win2" in same region as LB. <br>
I could not choose "Size" at the moment, because there were no VM available in this region.
![something going wrong](https://user-images.githubusercontent.com/22638433/77929541-7459aa80-72b2-11ea-9ffd-e04f9a183a85.PNG)

Configure network connections.
![something going wrong](https://user-images.githubusercontent.com/22638433/77929541-7459aa80-72b2-11ea-9ffd-e04f9a183a85.PN)

Configure LB on the same tab. <br>
Create server pool "pool_test2".
![something going wrong](https://user-images.githubusercontent.com/22638433/77929541-7459aa80-72b2-11ea-9ffd-e04f9a183a85.PN)

Connect to our VM "Win2". <br>
For install IIS in Power Shell run command "Install-WindowsFeature -name Web-Server -IncludeManagementTools". <br>

_________

Сontinue to configure LB. <br>
Create Health probes "Zond_test".
![something going wrong](https://user-images.githubusercontent.com/22638433/77929541-7459aa80-72b2-11ea-9ffd-e04f9a183a85.PN)

Create Load balancing rules "RuleforLB".
![something going wrong](https://user-images.githubusercontent.com/22638433/77929541-7459aa80-72b2-11ea-9ffd-e04f9a183a85.PN)

Check our configurations. <br>
Enter to IP VM (52.148.150.117) and IP LB (52.143.83.234).
![something going wrong](https://user-images.githubusercontent.com/22638433/77929541-7459aa80-72b2-11ea-9ffd-e04f9a183a85.PN)


##### 5.1.4. Create IIS server via Azure Portal.

Create VM and install IIS on this VM.

![something going wrong](https://user-images.githubusercontent.com/22638433/76379908-0d537080-635a-11ea-83a4-9f2922fbfc9c.PN)