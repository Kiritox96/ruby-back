first:
	sudo docker build -t nginx .
	sudo docker run --rm --name nginx -p 80:80 -d nginx

run:
	sudo docker stop nginx  
	sudo docker build -t nginx  . 
	sudo docker run --rm --name nginx -p 80:80 -d nginx
