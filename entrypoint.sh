#!/bin/bash
service ssh restart
echo $PUBLIC_KEY >> ~/.ssh/authorized_keys

if [ -z ${ANYCONNECT_GROUP+x} ]; 
    then echo $ANYCONNECT_PASSWORD | openconnect -u $ANYCONNECT_USER $ANYCONNECT_SERVER --passwd-on-stdin; 
    else echo $ANYCONNECT_PASSWORD | openconnect -u $ANYCONNECT_USER --authgroup $ANYCONNECT_GROUP $ANYCONNECT_SERVER --passwd-on-stdin; 
fi