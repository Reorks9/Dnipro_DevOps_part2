# Module 1 GIT, Docker.

## TASK 1.2 Docker.

#### Consider 2 options for installing Jenkins: installation using apt-get and war file.

### Installation using war.

##### Enter command into terminal (build image):
    docker build -t jenkins .

"jenkins" - it's name container which we are creating.<br>
Create, for example on Desktop, folder with name "jenkins".<br>
##### Enter command into terminal (run image):
    docker run -t -p 8080:8080 -v /home/serg/Desktop/jenkins/:/var/lib/jenkins jenkins

/home/serg/Desktop/jenkins:/var/lib/jenkins - host_folder:container_folder

Enter to the browser "localhost:8080".<br>
Enter a secret key for jenkins (we can see secret key in terminal window).<br>
Create a new user and password.<br>
Install a necessary plugins.<br>
Make the necessary settings. All of them are written in the container and in the folder "jenkins" on the local host.<br>
The next time you start the container, the image will start already configured.


### Installation using apt-get.

Dockerfile2 and plugins.txt must be in the same folder.<br>
Dockerfile2 must be renamed to Dockerfile before using.

##### Enter command into terminal (build image):
    docker build -t jenkins .

"jenkins" - it's name container which we are creating.<br>

##### Enter command into terminal (run image):
    docker run -t -p 8080:8080 --name myjenkins jenkins

--name myjenkins - choose my own name (in other situation name was choosed by random, for example vigorous_einstein)<br>
jenkins - it's name container which we are creating.


### Additional commands.

##### View all containers
    docker ps -a

##### View all images
    docker image ls

##### Enter in our running container
    docker exec -it jenkins /bin/bash

##### Remove all images
    docker rmi $(docker images -a -q)

-f - force delete (key enter after rmi)

##### Remove all containers
    docker rm $(docker ps -a -q)