# docker-ssh

copy your ssh public on root folder. And run these command
-----------------------------------

sudo docker build -t testserver-ssh . 
-------------------------------------

sudo docker run -d -p 23:22 testserver-ssh
------------------------------------------
