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

For API

get all animes:
	/anime

get anime in evidenza:
	/anime/anime?type=evidenza

get anime suggeriti:
	/anime/anime?type=suggeriti

get anime ordina da 0 a max episodi:
	/anime/anime?order=ordina_piu_episodi

get anime ordina da max a 0 episodi:
	/anime/anime?order=ordina_meno_episodi

get all users:
	/user

get user from id:
        /user/user?user_id=match
