#!/bin/sh
################################################################################
#Copyright (C) 2016  Frédéric PINAUD
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.
################################################################################
#
echo '----------------------------------' >> "$CHECK_LOG_FILE"
echo `date` >> "$CHECK_LOG_FILE"

LOCAL_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)

CLOUD_IP=$(dig +short "$CLOUD_HOST")
MOSQUITTO_IP=$(dig +short "$MOSQUITTO_HOST")
GRAFANA_IP=$(dig +short "$GRAFANA_HOST")
NODE_IP=$(dig +short "$NODE_HOST")

if [ "$LOCAL_IP" != "$CLOUD_IP" ]; then
  echo 'Update cloud hostname' >> "$CHECK_LOG_FILE"
  ./cloud.sh
fi

if [ "$LOCAL_IP" != "$MOSQUITTO_IP" ]; then
  echo 'Update mosquitto hostname' >> "$CHECK_LOG_FILE"
  ./mosquitto.sh
fi

if [ "$LOCAL_IP" != "$GRAFANA_IP" ]; then
  echo 'Update grafana hostname' >> "$CHECK_LOG_FILE"
  ./grafana.sh
fi

if [ "$LOCAL_IP" != "$NODE_IP" ]; then
  echo 'Update node-red hostname' >> "$CHECK_LOG_FILE"
  ./node.sh
fi