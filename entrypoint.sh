#!/bin/bash
echo "creating mosquitto password $MQTT_USERNAME $MQTT_PASSWORD"
mosquitto_passwd -c -b /mosquitto/config/passwd $MQTT_USERNAME $MQTT_PASSWORD 
chown -R mosquitto:mosquitto /mosquitto
/usr/sbin/mosquitto -c /mosquitto/config/mosquitto.conf
