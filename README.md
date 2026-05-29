# ROS Noetic + rosserial_server + rosservice + Docker

This is a simple docker image for running rosserial_server.

1. It is based on ROS Noetic.
2. It is based on the `rosservice_server` branch of https://github.com/tongtybj/rosserial which adds support for rosservice.
3. It is designed to work with OpenMower[Mowgli] (really this just means the default params are set appropriately and there is an example `docker-compose.yaml`).
4. It is inspired by [mowgli-docker](https://github.com/cedbossneo/mowgli-docker) by @cedbossneo