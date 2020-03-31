# Module 5 Azure.

#### Homework: 
* 1. Create VNet, VM, Loadbalancer, IIS server via Azure Portal.
* 2. Create IIS server via ARM template.
* 3. Change IIS default start page (ARM template or custom script).


##### 5.1.1. Create VNet.

Create resource group "vnet_resource" and virtual network "vnet_for_hw".

![something going wrong](https://user-images.githubusercontent.com/22638433/78031278-fe197e80-736b-11ea-8199-d2b32c3880f1.PNG)

Configure IP addresses range 10.2.0.0/16 and subinterfaces 10.2.10.0/24 and 10.2.20.0/24.

![something going wrong](https://user-images.githubusercontent.com/22638433/78031281-ff4aab80-736b-11ea-8d1a-9bada18668f1.PNG)

As a result we get:

![something going wrong](https://user-images.githubusercontent.com/22638433/78031285-ffe34200-736b-11ea-8d35-b340143d7e28.PNG)


##### 5.1.2. Create VM.

Create in the resource group "Resource1" virtial machine "TESTPC1" with connection to her through SSH.

![something going wrong](https://user-images.githubusercontent.com/22638433/78031287-ffe34200-736b-11ea-9714-2b0a062fa8de.PNG)

Connect to out VM through SSH.

![something going wrong](https://user-images.githubusercontent.com/22638433/78031288-007bd880-736c-11ea-887e-780abc3fde48.PNG)


##### 5.1.3. Create Loadbalancer.

Create in resource group "Win" LoadBalancer "LB".<br>
In the other tabs, do not change anything. <br>
The numbers in the names of the created tools do not match, because the tools have already been created earlier and work correctly. <br>
![something going wrong](https://user-images.githubusercontent.com/22638433/78031370-243f1e80-736c-11ea-8f06-282c52515278.PNG)

Create VM "Win2" in same region as LB. <br>
I could not choose "Size" at the moment, because there were no VM available in this region.
![something going wrong](https://user-images.githubusercontent.com/22638433/78031372-24d7b500-736c-11ea-8b02-d60a66aea7bf.PNG)

Configure network connections.
![something going wrong](https://user-images.githubusercontent.com/22638433/78031373-24d7b500-736c-11ea-9fba-81601e3e6811.PNG)

Configure LB on the same tab. <br>
Create server pool "pool_test2".
![something going wrong](https://user-images.githubusercontent.com/22638433/78031376-25704b80-736c-11ea-9025-85a18c69a3f9.PNG)

Connect to our VM "Win2". <br>
For install IIS in Power Shell run command "Install-WindowsFeature -name Web-Server -IncludeManagementTools". <br>

_________

Сontinue to configure LB. <br>
Create Health probes "Zond_test".
![something going wrong](https://user-images.githubusercontent.com/22638433/78031377-2608e200-736c-11ea-806a-9b4554a0a88a.PNG)

Create Load balancing rules "RuleforLB".
![something going wrong](https://user-images.githubusercontent.com/22638433/78031381-2608e200-736c-11ea-91c5-f8b3f94ae79b.PNG)

Check our configurations. <br>
Enter to IP VM (52.148.150.117) and IP LB (52.143.83.234).
![something going wrong](https://user-images.githubusercontent.com/22638433/78031384-26a17880-736c-11ea-9baf-cfd64bfbc5b8.PNG)


##### 5.1.4. Create IIS server via Azure Portal.

Create VM and install IIS on this VM.

![something going wrong](https://user-images.githubusercontent.com/22638433/78031503-50f33600-736c-11ea-938f-eebacefd948f.PNG)


##### 5.2. Create IIS server via ARM template.

For deployment use next files: <br>
* template_for_IIS_original.json  
* parameters.json

![something going wrong](https://user-images.githubusercontent.com/22638433/78031508-52246300-736c-11ea-9fb6-1ecf587e8520.PNG)



##### 5.3. Change IIS default start page (ARM template or custom script).

For deployment use next files: <br>
* template_for_IIS_non_original.json  
* parameters.json

![something going wrong](https://user-images.githubusercontent.com/22638433/78031510-52bcf980-736c-11ea-8c11-d50394861f83.PNG)


#### Links

    https://docs.microsoft.com/en-us/azure/load-balancer/tutorial-load-balancer-standard-manage-portal