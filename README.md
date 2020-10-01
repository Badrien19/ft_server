# ft_server

docker build -t *nomimage* .

docker run -d -p 80:80 --name=*nomconteneur* *nomimage*
or
docker run -i -p 80:80  server bash

docker run -i -p 80:80 -p 443:443 server bash

docker exec -ti *nomconteneurouid* bash