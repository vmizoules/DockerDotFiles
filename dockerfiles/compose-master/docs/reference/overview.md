<!--[metadata]>
+++
title = "Introduction to the CLI"
description = "Introduction to the CLI"
keywords = ["fig, composition, compose, docker, orchestration, cli,  reference"]
[menu.main]
parent = "smn_compose_cli"
weight=-2
+++
<![end-metadata]-->


# Introduction to the CLI

This section describes the subcommands you can use with the `docker-compose` command.  You can run subcommand against one or more services. To run against a specific service, you supply the service name from your compose configuration. If you do not specify the service name, the command runs against all the services in your configuration.


## Commands

* [docker-compose Command](docker-compose.md)
* [CLI Reference](index.md)


## Environment Variables

Several environment variables are available for you to configure the Docker Compose command-line behaviour.

Variables starting with `DOCKER_` are the same as those used to configure the
Docker command-line client. If you're using `docker-machine`, then the `eval "$(docker-machine env my-docker-vm)"` command should set them to their correct values. (In this example, `my-docker-vm` is the name of a machine you created.)

### COMPOSE\_PROJECT\_NAME

Sets the project name. This value is prepended along with the service name to the container container on start up. For example, if you project name is `myapp` and it includes two services `db` and `web` then compose starts containers named  `myapp_db_1` and `myapp_web_1` respectively.

Setting this is optional. If you do not set this, the `COMPOSE_PROJECT_NAME` defaults to the `basename` of the current working directory.

### COMPOSE\_FILE

Specify the file containing the compose configuration. If not provided, Compose looks for a file named  `docker-compose.yml` in the current directory and then each parent directory in succession until a file by that name is found.

### COMPOSE\_API\_VERSION

The Docker API only supports requests from clients which report a specific
version. If you receive a `client and server don't have same version error` using
`docker-compose`, you can workaround this error by setting this environment
variable. Set the version value to match the server version.

Setting this variable is intended as a workaround for situations where you need
to run temporarily with a mismatch between the client and server version. For
example, if you can upgrade the client but need to wait to upgrade the server.

Running with this variable set and a known mismatch does prevent some Docker
features from working properly. The exact features that fail would depend on the
Docker client and server versions. For this reason, running with this variable
set is only intended as a workaround and it is not officially supported.

If you run into problems running with this set, resolve the mismatch through
upgrade and remove this setting to see if your problems resolve before notifying
support.

### DOCKER\_HOST

Sets the URL of the `docker` daemon. As with the Docker client, defaults to `unix:///var/run/docker.sock`.

### DOCKER\_TLS\_VERIFY

When set to anything other than an empty string, enables TLS communication with
the `docker` daemon.

### DOCKER\_CERT\_PATH

Configures the path to the `ca.pem`, `cert.pem`, and `key.pem` files used for TLS verification. Defaults to `~/.docker`.

### COMPOSE\_HTTP\_TIMEOUT

Configures the time (in seconds) a request to the Docker daemon is allowed to hang before Compose considers
it failed. Defaults to 60 seconds.


## Related Information

- [User guide](../index.md)
- [Installing Compose](../install.md)
- [Compose file reference](../compose-file.md)
