docker build -t team .
docker run -it -p 9987:9987/udp -p 30033:30033 -p 10011:10011 team bash 
