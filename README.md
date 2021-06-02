# DataWeave Tools

## Playground


#### Hosted
The official, hosted playground can be found at https://developer.mulesoft.com/learn/dataweave (or https://dwlang.fun for a shorter redirect).

#### CLI

To launch the playground for the [CLI](#CLI) use the following command:

```shell
dw --eval --spell Playground
```

#### Docker

The playground can also be run (with support for multiple versions of dataweave) via docker: https://hub.docker.com/r/machaval/dw-playground/tags

To help you get started, you can use the docker compose file found [here](/dataweave-playgrounds-docker/docker-compose.yml). Launching this file will create two images, one for the latest version of dataweave (as of commiting this file) running on port 9999, and one for the latest version of dataweave 1, running on port 9998. To create the images from this file, `cd` into the directory and run the following command:

```shell
docker compose up -d
```

_Note: If you aren't running the latest docker CLI, and instead are using the separate docker-compose CLI, run `docker-compose`_

---