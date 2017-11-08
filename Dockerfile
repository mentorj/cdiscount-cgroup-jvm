FROM debian:stretch
MAINTAINER Jerome MOLIERE
RUN apt  update && apt -y install openjdk-8-jre
ADD my_app /usr/local/my_app
ADD entrypoint.sh /usr/local/my_app
WORKDIR /usr/local/my_app
ENTRYPOINT /usr/local/my_app/entrypoint.sh



