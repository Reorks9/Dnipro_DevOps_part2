# Module 2 Jenkins, GitLab.

### TASK 2.2 Jenkins. Pipeline for javascrit application.

#### Create jenkinsfile for frontend.

##### stage('SCM Checkout')
Credentials check for GitHub with frontend data.<br>

##### stage('Git clone')
Data clone on PC.<br>

##### stage('Build app')
Rename environment.<br>
Node install.<br>
Run build.

##### stage('Copy files to server')
Copy builded data to DevServer.


#### Create jenkinsfile for backend.

##### stage('SCM Checkout')
Credentials check for GitHub with frontend data.<br>

##### stage('Git clone')
Data clone on PC.<br>

##### stage('Build app')
Rename environment.<br>

##### stage('Copy files to server')
Copy data to DevServer.

#####  stage('Run app on server')
Run app on DevServer.
