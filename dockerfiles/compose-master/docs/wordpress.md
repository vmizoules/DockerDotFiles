<!--[metadata]>
+++
title = "Quickstart Guide: Compose and WordPress"
description = "Getting started with Compose and WordPress"
keywords = ["documentation, docs,  docker, compose, orchestration, containers"]
[menu.main]
parent="smn_workw_compose"
weight=6
+++
<![end-metadata]-->


# Quickstart Guide: Compose and WordPress

You can use Compose to easily run WordPress in an isolated environment built
with Docker containers.

## Define the project

First, [Install Compose](install.md) and then download WordPress into the
current directory:

    $ curl https://wordpress.org/latest.tar.gz | tar -xvzf -

This will create a directory called `wordpress`. If you wish, you can rename it
to the name of your project.

Next, inside that directory, create a `Dockerfile`, a file that defines what
environment your app is going to run in. For more information on how to write
Dockerfiles, see the
[Docker user guide](https://docs.docker.com/userguide/dockerimages/#building-an-image-from-a-dockerfile) and the
[Dockerfile reference](http://docs.docker.com/reference/builder/). In this case,
your Dockerfile should be:

    FROM orchardup/php5
    ADD . /code

This tells Docker how to build an image defining a container that contains PHP
and WordPress.

Next you'll create a `docker-compose.yml` file that will start your web service
and a separate MySQL instance:

    web:
      build: .
      command: php -S 0.0.0.0:8000 -t /code
      ports:
        - "8000:8000"
      links:
        - db
      volumes:
        - .:/code
    db:
      image: orchardup/mysql
      environment:
        MYSQL_DATABASE: wordpress

A supporting file is needed to get this working. `wp-config.php` is
the standard WordPress config file with a single change to point the database
configuration at the `db` container:

    <?php
    define('DB_NAME', 'wordpress');
    define('DB_USER', 'root');
    define('DB_PASSWORD', '');
    define('DB_HOST', "db:3306");
    define('DB_CHARSET', 'utf8');
    define('DB_COLLATE', '');

    define('AUTH_KEY',         'put your unique phrase here');
    define('SECURE_AUTH_KEY',  'put your unique phrase here');
    define('LOGGED_IN_KEY',    'put your unique phrase here');
    define('NONCE_KEY',        'put your unique phrase here');
    define('AUTH_SALT',        'put your unique phrase here');
    define('SECURE_AUTH_SALT', 'put your unique phrase here');
    define('LOGGED_IN_SALT',   'put your unique phrase here');
    define('NONCE_SALT',       'put your unique phrase here');

    $table_prefix  = 'wp_';
    define('WPLANG', '');
    define('WP_DEBUG', false);

    if ( !defined('ABSPATH') )
        define('ABSPATH', dirname(__FILE__) . '/');

    require_once(ABSPATH . 'wp-settings.php');

### Build the project

With those four files in place, run `docker-compose up` inside your WordPress
directory and it'll pull and build the needed images, and then start the web and
database containers. If you're using [Docker Machine](https://docs.docker.com/machine), then `docker-machine ip MACHINE_VM` gives you the machine address and you can open `http://MACHINE_VM_IP:8000` in a browser.

## More Compose documentation

- [User guide](/)
- [Installing Compose](install.md)
- [Get started with Django](django.md)
- [Get started with Rails](rails.md)
- [Get started with WordPress](wordpress.md)
- [Command line reference](./reference/index.md)
- [Compose file reference](compose-file.md)
