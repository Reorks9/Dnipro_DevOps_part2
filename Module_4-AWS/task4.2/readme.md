# Module 4 AWS.

#### Homewok: 
* 1. Start an EC2 instance.
* 2. Add an EBS volume to the instance.
* 3. Set up a web server behind an application load balancer.
* 4. Check monitoring metrics of the instance created during the previous homework. Set up alerts.
* 5. Check CloudTrail logs and see who did what in your account.
* 6. Set up CloudWatch events.



##### 1. Create a new instance.

I have VPC "vpc 172.30.0.0/16".
Create 3 instance in our VPC:
* TEST1 in availability zone us-west-2a
* TEST2 in availability zone us-west-2b
* TEST3 in availability zone us-west-2b

![something going wrong](https://user-images.githubusercontent.com/22638433/76707439-eac5ac80-66f7-11ea-8202-7b9e3a129a56.PNG)

##### 2. Add an EBS volume to the instance.

![something going wrong]((https://user-images.githubusercontent.com/22638433/76707440-eb5e4300-66f7-11ea-938e-c71013ec3f62.PNG)

##### 3. Set up a web server behind an application load balancer.

Create Application LB "LBtest". <br>
Choose our VPC and our availability zones us-west-2a and us-west-2b.
Add (to Targets) our Instances which we created before this moment.

![something going wrong](https://user-images.githubusercontent.com/22638433/76707441-ebf6d980-66f7-11ea-8a08-c3409962d34e.PNG)

![something going wrong](https://user-images.githubusercontent.com/22638433/76707442-ebf6d980-66f7-11ea-940a-3dd2f4818641.PNG)

As a result, we get the following picture.

![something going wrong](https://user-images.githubusercontent.com/22638433/76707443-ebf6d980-66f7-11ea-98cf-9317dcff3a88.PNG)

Install nginx on instances "TEST1" and "TEST2".
Install apache on instance "TEST3". 
Go to DNS our LB (http://lbtest-1919773584.us-west-2.elb.amazonaws.com/)

![something going wrong](https://user-images.githubusercontent.com/22638433/76707444-ec8f7000-66f7-11ea-8044-b4c2b0dcaa3a.PNG)

![something going wrong](https://user-images.githubusercontent.com/22638433/76707445-ec8f7000-66f7-11ea-94de-cdfd808fbbf9.PNG)

##### 4. Check monitoring metrics of the instance created during the previous homework. Set up alerts.

I created metrics for network and CPU for few my Instances.

![something going wrong](https://user-images.githubusercontent.com/22638433/76707446-ed280680-66f7-11ea-9b5c-483849b4e32e.PNG)

I created alarm for CPU for one of my Instances. <br>
After creating alarm, I confirmed the delivery of letters to my mail.

![something going wrong](https://user-images.githubusercontent.com/22638433/76707447-ed280680-66f7-11ea-832c-8e3d91f9c98c.PNG)

![something going wrong](https://user-images.githubusercontent.com/22638433/76707449-edc09d00-66f7-11ea-8765-25d275edaf4c.PNG)

![something going wrong](https://user-images.githubusercontent.com/22638433/76707450-edc09d00-66f7-11ea-9269-66132228eb29.PNG)


##### 5. Check CloudTrail logs and see who did what in your account.

![something going wrong](https://user-images.githubusercontent.com/22638433/76707451-ee593380-66f7-11ea-9a6a-55ba00013ffc.PNG)


##### 6. Set up CloudWatch events.

I created event for EC2 snapshot notification for one from my Instances.

![something going wrong](https://user-images.githubusercontent.com/22638433/76707452-ee593380-66f7-11ea-9a16-9732641ee1d8.PNG)
