first:
	sudo docker build -t back .
	sudo docker run --rm --name back -p 3000:3000 -d back

run:
	sudo docker stop back
	sudo docker build -t back . 
	sudo docker run --rm --name back -p 3000:3000 -d back 
