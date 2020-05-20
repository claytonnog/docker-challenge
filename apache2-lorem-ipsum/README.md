# Docker Challenge

### Explanation
We have 3 files:

1 - Dockerfile:
With the image of apache (httpd), to host the webpage.

2 - Docker compose file:
It's used to build the service, using the Dockerfile provided.

3 - Html files
The html file will be copyied to the webserver and after you run the service, I will be displayed at the localhost, in the port provided in the docker compose file.

### How to use the solution

To use, you have to install git, docker and docker-compose in your machine.

Just clone the repository:
```
git clone https://github.com/claytonnog/docker-challenge/tree/master/apache2-lorem-ipsum
```

After that, just run the following command:
```
$ cd apache2-lorem-ipsum
$ docker-compose up --build
```

After changes in the index.html file, you have to run the command again.

### How to scale

We can scale that, by using a range of port in the docker compose file, and after that, using the following command:
```
$ docker-compose up --scale webserver=2
```

Using the following command we are able to see the containers running and the ports assigned:
```
$ docker-compose ps
             Name                     Command        State          Ports        
---------------------------------------------------------------------------------
apache2-lorem-ipsum_webserver_1   httpd-foreground   Up      0.0.0.0:8080->80/tcp
apache2-lorem-ipsum_webserver_2   httpd-foreground   Up      0.0.0.0:8081->80/tcp
```

Use the browser to test that.

### Improvements

We also can install a balancer in front of the webserver, using HAproxy for example, to balance the traffic between the apache servers.

About the scale, we can use docker swarm to scale the services as well.


