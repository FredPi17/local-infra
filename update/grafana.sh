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
CONFIG_FILE=$1

echo '----------------------------------' >> $GRAFANA_LOG_FILE
echo `date` >> $GRAFANA_LOG_FILE

IP=`dig +short myip.opendns.com @resolver1.opendns.com`
OLDIP=`dig +short $GRAFANA_HOST`
if [ -n "$DEBUG" ]; then
  echo "DEBUG ENV: " $CONFIG_FILE $GRAFANA_HOST $GRAFANA_LOGIN $PASSWORD $GRAFANA_LOG_FILE
fi

if [ "$IP" ]; then
    echo -n "Old IP: [$OLDIP]" >> $GRAFANA_LOG_FILE
    echo -n "New IP: [$IP]" >> $GRAFANA_LOG_FILE
    curl "http://www.ovh.com/nic/update?system=dyndns&hostname=$GRAFANA_HOST&myip=$IP" -u $GRAFANA_LOGIN:$PASSWORD
else
  echo "Error: WAN IP not found. Exiting!" >> $GRAFANA_LOG_FILE
fi
