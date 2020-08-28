FROM ubuntu:18.04

ENV TZ=Asia

ADD test.zip ./test.zip

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt install -y golang git curl wget && \
    apt-get install binwalk -y && \
    apt-get install postgresql -y && \
    apt-get install python3-pip -y && \
    apt-get install zip -y && \
    apt-get install git -y && \
    apt-get install apache2 -y && \
    apt-get install nginx -y && \
    apt-get clean


EXPOSE 80

CMD [ "nginx" , "-g", "daemon off;" ]
