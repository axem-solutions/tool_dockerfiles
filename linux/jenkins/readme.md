# Start Your own on your server/PC Jenkins

## Build Axem specific jenkins image
docker build -t jenkins_axem:v1.0.0 .

## Create Jenkins Home folder
mkdir -p /home/$USER/jenkins_home_axem

## Start Jenkins
docker run -p 8080:8080 -p 50000:50000 -d --name jenkins --group-add $(stat -c '%g' /var/run/docker.sock) -v /var/run/docker.sock:/var/run/docker.sock -v /home/$USER/jenkins_home_axem:/var/jenkins_home jenkins_axem:v1.0.0



