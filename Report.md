# Project 5

## Part 1

1. Download the ossicial docker image from nginx using `docker pull`
 
![docker_pull](data/1.png)

2. Check docker image with `docker images`
 
![docker_images](data/2.png)

3. Run docker image wtih `docker run -d nginx`
 
![run_docker](data/3.png)

4. Check that the image running with `docker ps`
  
![check_run](data/4.png)

5. View container information with `docker inspect 65fe76f94d2d` and define the container size, list of mapped ports and container ip

| Name  |  Value     |
|-------|------------|
| Size  | 165265408  |
| Ports | none       |
| IP    | 172.17.0.2 |

6. Stop docker container with `docker stop`
 
![docker_stop](data/5.png)

7. Check that the container has stoppesd with `docker ps`
 
![check_stop](data/6.png)

8. Run docker with ports 80 and 443 in container, mapped to the same ports on the local machine
 
![run_wtih_ports](data/7.png)

9. Check that the nginx start page is available in the browsew at _localhost:80_
 
![nginx](data/8.png)

10. Restart docker with `docker restart`
 
![restart](data/9.png)

11. Check that the container has started
 
![check_restart](data/10.png)

## Part 2

1. Reading the _nginx.conf_ configuration file inside the docker container with `exec` command
 
![conf](data/11.png)
 
2. Creating a _nginx.conf_ file on the local machine and configuring it on the _/status_ path to return the nginx server status page
 
![status](data/12.png)

3. Coping the created _nginx.conf_ inside the docker image using `docker cp` command
 
![copy](data/13.png)

4.  Restarting _nginx_ inside the docker image with `exec`
 
![restart](data/14.png)

5. Checking that _localhost:80/status_ the nginx server status page
 
![check](data/15.png)

6. Exporting the container to a _container.tar_ with the `docker export` command
 
![export](data/16.png)

7. Stopping the container
 
![stop](data/17.png)

8. Deleting the image with `docker rmi` without removing the container
 
![delete_image](data/18.png)

9. Deleting stoped container
 
![delete_container](data/19.png)

10. Importing the container back using the `import` command
 
![import](data/20.png)

11. Runing the imported container
 
![run_import](data/21.png)

12. Checking that _localhost:80/status_ returns the nginx server status page
 
![check_status](data/22.png)