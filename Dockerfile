FROM ubuntu:latest
RUN apt update && apt upgrade -y
RUN apt install cron nano dnsutils curl -y
WORKDIR /
RUN mkdir update
WORKDIR /update
COPY update .
RUN chmod 777 mosquitto.sh node.sh grafana.sh cloud.sh
RUN lines="0 1 * * * cd /update && ./mosquitto.sh && ./node.sh && ./grafana.sh && ./cloud.sh" && echo "$lines" | crontab -u root -

CMD ["tail","-f","/dev/null"]