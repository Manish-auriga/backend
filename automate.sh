#!/bin/bash
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
NAME=manish22072004
cd /home/manish_sharma/app
echo $docker_password | sudo docker login --username manish22072004 --password-stdin

# sudo docker build -t $NAME/frontend:$TIMESTAMP ./frontend
# ../
sudo docker build -t $NAME/backendprivate:$TIMESTAMP .


# sudo docker push $NAME/frontend:$TIMESTAMP 
sudo docker push $NAME/backendprivate:$TIMESTAMP 

# sudo docker rmi $NAME/frontend:$TIMESTAMP   
sudo docker rmi $NAME/backendprivate:$TIMESTAMP


# sed -i "s|image: $NAME/frontend:.*|image: $NAME/frontend:$TIMESTAMP|" docker-compose.yml
sed -i "s|image: $NAME/backendprivate:.*|image: $NAME/backendprivate:$TIMESTAMP|" docker-compose.yml


sudo docker compose down
sudo docker compose up -d 