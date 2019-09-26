# README
 
For build 

docker build -t demo .

For run

docker run -it --rm --name back -p 3000:3000 -d demo rails s

For logs 

docker logs -f back

For stop

docker stop back

For inspect 

docker inspect back