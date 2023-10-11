# MQTT Service on Fly.io



This repository contains the configuration files and setup for deploying an MQTT service on Fly.io. MQTT is a lightweight messaging protocol widely used in IoT and real-time communication scenarios.

## Overview

In this project, we leverage the Fly.io platform to deploy an MQTT broker using the Eclipse Mosquitto broker image. The configuration ensures that the MQTT service is accessible from external clients over the internet.

## Requirements

- [Fly.io account](https://fly.io/signup)
- [Fly CLI](https://fly.io/docs/fly-cli/)
- Docker (if you want to build a custom MQTT Docker image)

## Getting Started

1. Clone this repository to your local machine.
	```bash
	git clone https://github.com/acidobinario/mqtt-fly.io.git
	```
	
3. Deploy to Fly.io
    - Make sure you are logged in to Fly.io with the Fly CLI.
	```bash
   fly login
	```
	- Configure MQTT secrets using the fly cli
	```bash
	# Create secrets for MQTT username and password
	fly secrets set MQTT_USERNAME=yourusername MQTT_PASSWORD=yourpassword
	```
	- Deploy your MQTT service to Fly.io:
	```bash
	fly deploy
	```
	- The Fly.io platform will allocate resources and deploy your MQTT service.
	
4. Access Your MQTT Service
   - Once the deployment is complete, your MQTT service will be accessible over the internet. You can find the hostname in the Fly.io dashboard.
 
5. Allocate a Dedicated IPv4 Address (if necessary)
	- In some cases, you may need a dedicated private IPv4 address for your MQTT service. If you experience connectivity issues, consider allocating a dedicated private IPv4 address:
	```bash
	fly ips allocate-v4
	```

6. Testing MQTT Connectivity
	- Use an MQTT client, like `mosquitto_pub` and `mosquitto_sub`, to test the connectivity to your MQTT service. Replace `<your-hostname>` with your actual hostname or IP address.
	 ```bash
     mosquitto_sub -t 'test/topic' -u $MQTT_USERNAME -P $MQTT_PASSWORD -h <your-hostname> -d
	 mosquitto_pub -t 'test/topic' -m 'helloWorld' -u $MQTT_USERNAME -P $MQTT_PASSWORD -h <your-hostname> -d
     ```

2.  Enjoy Your MQTT Service
    - Your MQTT service is now accessible and ready for use in your applications, devices, or IoT projects.

## Configuration Files

-   `Dockerfile`: Main Dockerfile for creating a Docker image for your MQTT service using Eclipse Mosquitto.
-   `entrypoint.sh`: An entrypoint script to set MQTT credentials and start the MQTT broker.
-   `fly.toml`: Configuration file for Fly.io, specifying the app name and service details.
-   `mosquitto.conf`: Configuration file for the Eclipse Mosquitto MQTT broker.

## Troubleshooting

If you encounter issues with your MQTT service deployment, consider the following:

-   Check the Fly.io dashboard for deployment status and error messages.
-   Review the MQTT broker logs using the Fly.io SSH console to diagnose issues.

## License

This project is licensed under the [WTFPL License](http://www.wtfpl.net/txt/copying/). Feel free to modify and adapt it to your needs.

## Author

[acidobinario](https://github.com/acidobinario)

