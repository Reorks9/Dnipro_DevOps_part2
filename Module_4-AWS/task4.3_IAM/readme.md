# Module 4 AWS.

#### Homewok: 
1. Create a bucket and add a file to the bucket. <br>
2. Create an IAM user. <br>
3. Allow the IAM user read/write access to the file in the bucket. <br>
4. Create an IAM group. <br>
5. Add the user to the group. <br>
6. Add a policy to the group. <br>
7. Create and use a role.


##### 1. Create a bucket and add a file to the bucket.

Create a bucket "reorks-bucket" and add a file "Capture.PNG" to the bucket.

![something going wrong](https://user-images.githubusercontent.com/22638433/77229045-192e0680-6b94-11ea-871b-839f93b2b28c.PNG)

##### 2. Create an IAM user.

Create an IAM user "IAM-test".

![something going wrong](https://user-images.githubusercontent.com/22638433/77229048-19c69d00-6b94-11ea-9e6f-5f244f814e3e.PNG)

##### 3. Allow the IAM user read/write access to the file in the bucket.

Create policy "test_policy_for_file_on_reorks_bucket".

![something going wrong](https://user-images.githubusercontent.com/22638433/77229049-1a5f3380-6b94-11ea-864e-bc891800f7ef.PNG)

Attach this policy to our IAM user "IAM-test".

![something going wrong](https://user-images.githubusercontent.com/22638433/77229050-1a5f3380-6b94-11ea-821b-c0eb9e4f72bc.PNG)


##### 4. Create an IAM group.

Create an IAM group "TestGroupForIAM-test".

![something going wrong](https://user-images.githubusercontent.com/22638433/77229051-1af7ca00-6b94-11ea-833c-106ed1000867.PNG)


##### 5. Add the user to the group.

Add the user "IAM-test" to the group "TestGroupForIAM-test".

![something going wrong](https://user-images.githubusercontent.com/22638433/77229052-1af7ca00-6b94-11ea-9626-a62f1f36b260.PNG)


##### 6. Add a policy to the group.

Add a policy "test_policy_for_file_on_reorks_bucket" to the group "TestGroupForIAM-test".

![something going wrong](https://user-images.githubusercontent.com/22638433/77229054-1b906080-6b94-11ea-8847-ca27d682ff40.PNG)


##### 7. Create and use a role.

Create a role "Test_role_for_EC2".

![something going wrong](https://user-images.githubusercontent.com/22638433/77229055-1b906080-6b94-11ea-85c3-6c6114b322a3.PNG)

Create a new instance and add our role "Test_role_for_EC2".

![something going wrong](https://user-images.githubusercontent.com/22638433/77229056-1b906080-6b94-11ea-8ad1-ab07eddb6e72.PNG)
