# Local infrastructure 

This infrastructure is composed of Mysql, Grafana, Mosquitto, Node-red, and an ubuntu image that updates OVH dynDNS.

## Why this infrastructure ?

It allows home sensors to send data each others and to be stored in the Mysql database. 

### Mosquitto

* Mosquitto connects sensors with these topics: 
    * `/capteur/bureau` for the office sensor
    * `/capteur/chambre` for the bedroom sensor
    * `/capteur/serveur` for the server sensor enclosing


### Node-Red

Node-Red is the interface to get/post and analyse data from topic and interact with other services.

Different flows are available: 
* Netatmo: it gets all data from the weather station and store them to the Mysql database
* Weather sensors: listen for topics `/capteur/#` to get data and save them in Mysql
* Alertes grafana: that listens to different alerts from the Grafana server
* Telegram indoor: routes to get netatmo informations for indoor sensors
* Telegram outdoor: routes to get netatmo informations for outdoor sensors

### Mysql

Mysql is the database that allows all services to store data

### Grafana 

Grafana is the interface to show data stored in Mysql. Each service is related to its dashboard in Grafana. 