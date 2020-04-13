FROM ubuntu:latest
RUN apt update && apt upgrade -y
RUN apt install cron nano -y
WORKDIR /
RUN mkdir update
WORKDIR /update
COPY update .

RUN lines="0 1 * * * cd /update && ./mosquitto.sh && ./node.sh && grafana.sh && cloud.sh" && echo "$lines" | crontab -u root -

CMD ["tail","-f","/dev/null"]