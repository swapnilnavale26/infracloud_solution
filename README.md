# infracloud_solution
# infracloud assignment for Devops role

1] Installed docker on my local machine from https://docs.docker.com/get-started/ and selecting "Install Docker Desktop on Windows"

2] Pulled few images required for the assignement from dockehub using following commands:
docker pull infracloudio/csvserver:latest
docker pull prom/prometheus:v2.22.0

3] Tried running container from imageid 8cb989ef80b5 (image-name infracloudio/csvserver:latest)
commands used:
To list images:
docker images
take a images from outout of above command and run container using below command
docker run -d infracloudio/csvserver:latest

Error occured:
2022/09/24 13:27:24 error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory

4] Created and tested script gencsv.sh to generate a file named inputFile
To make script executable:
chmod 755 gencsv.sh
To make inputFile readble to others:
chmod 744 inputFile

5]To Run the container along with file generated from bash script executed container with bind mount assignement and it fixed error observed initially.

docker run -d -v /root/solution/inputFile:/csvserver/inputdata --name swap_csvserver 8cb989ef80b5

To check process and find port for application:
docker exec -ti swap_csvserver /bin/bash

netstat -ntpl

To stop container:
docker stop swap_csvserver

6]Exposed the container port 9300 to host port 9393
docker run -d -v /root/solution/inputFile:/csvserver/inputdata -p 9393:9300 --name swap_csvserver 8cb989ef80b5

7]To set the evironemnt variable CSVSERVER_BORDER to have value Orange

docker run -d -v /root/solution/inputFile:/csvserver/inputdata -p 9393:9300 -e CSVSERVER_BORDER='Orange' --name swap_csvserver 8cb989ef80b5

8]To push all file to github:
First clone my personal repository:
git clone https://github.com/swapnilnavale26/infracloud_solution.git

Substeps: Please note you need to create access token in order to establish connecton to github.

To add files:
git add
To commit:
git commit
To push to github:
git push https://github.com/swapnilnavale26/infracloud_solution.git
