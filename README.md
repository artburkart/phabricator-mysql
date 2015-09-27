# Phabricator MySQL Docker Container

[GitHub Repo](https://github.com/artburkart/phabricator-mysql)


This is an alternative image to that provided by [yesnault/docker-phabricator-mysql](https://hub.docker.com/r/yesnault/docker-phabricator-mysql/)
It uses Tutum's [MySQL image](https://hub.docker.com/r/yesnault/docker-phabricator-mysql/) to bootstrap the databases.

It includes a docker-compose file that uses images instead of relative files.

To fire up a Phabricator instance, run:

```console
docker-machine create --driver virtualbox phabricator
cd /path/to/phabricator-mysql
docker-compose up -d
```

You can also use this `docker-compose.yml` file as a Tutum stackfile.
