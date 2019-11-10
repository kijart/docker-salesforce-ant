# Docker Salesforce Ant

Run **Salesforce Ant migration tool** inside docker.

More info in [Salesforce Ant Migration Tool](https://developer.salesforce.com/docs/atlas.en-us.daas.meta/daas/forcemigrationtool_install.htm).

## Docker setup

Install docker: https://docs.docker.com/engine/installation/

Docker documentation: https://docs.docker.com/

## Usage

### Build-in docker image

- build docker image `docker build -t salesforce-ant .`

- list Apache Ant options: `docker run --rm salesforce-ant ant -h`

- run salesforce: `docker run --rm -v $(pwd)/config:/salesforce salesforce-ant ant`

### Docker Hub image

- pull latest Salesforce Ant docker image version from docker hub: `docker pull kijart/salesforce-ant`

- pull a Salesforce Ant specific version (v47.0) docker image from docker hub: `docker pull kijart/salesforce-ant:47.0`

- create a Salesforce Ant docker container

```bash
docker create \
  --name=salesforce-ant \
  -v $(pwd)/config:/salesforce \
  kijart/salesforce-ant:47.0
```

### build.xml and build.properties

Update files build.xml and build.properties properly to run your own tasks.
