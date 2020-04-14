FROM ubuntu:latest
RUN apt update && apt upgrade -y
RUN apt install cron nano dnsutils curl -y
WORKDIR /
RUN mkdir update
WORKDIR /update
COPY update .
RUN chmod 777 mosquitto.sh node.sh grafana.sh cloud.sh check.sh
RUN lines="30 * * * * cd /update && ./check.sh" && echo "$lines" | crontab -u root -

CMD ["tail","-f","/dev/null"]