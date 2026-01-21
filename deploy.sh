sudo docker stop acceso-container 2>/dev/null
sudo docker rm acceso-container 2>/dev/null

sudo docker build -t acceso .

sudo docker run \
           --restart always \
           -d -p 8082:8082 \
           --env-file .env \
           --network appx \
           --add-host=host.docker.internal:host-gateway \
           --name acceso-container acceso
