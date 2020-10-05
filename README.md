# ft_server

# TO DO

- [x] Nginx
- [x] Certificat SSL
- [x] URL redirection
- [x] Wordpress
- [x] Phpmyadmin
- [x] Mysql
- [ ] Clean to src/
# LOG

phpMyadmin
user: wordpress_user
password: password

# COMMAND

"docker build -t *nomimage* .": to create image

"docker run -d -p 80:80 -p 443:443 --name=*nomconteneur* *nomimage*": (--name not requiert) 
To lauch in background (should uncomment two last command on start.sh)

or

"docker run -it -p 80:80 -p 443:443 *nomimage* bash":
To lauch with interraction, should "sh start.sh" to lauch server

"docker exec -it *nomconteneurouid* bash":
for acces in background

"docker-machine ip" to get server ip