# DataWeave Tools

## Playground


#### Hosted
The official, hosted playground can be found at https://developer.mulesoft.com/learn/dataweave (or https://dwlang.fun for a shorter redirect).

#### CLI

To launch the playground from the [CLI](#cli-1) use the following command:

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


## CLI

Via mulesoft-labs, you can download a CLI tool that allows you to run DataWeave scripts outside of MuleSoft applications.

For detailed instructions, see the GitHub repository: https://github.com/mulesoft-labs/data-weave-native

#### Mac

Using homebrew, run the following:

```shell
brew tap mulesoft-labs/data-weave
brew install dw
```

#### Windows

1. Download the zip: https://github.com/mulesoft-labs/data-weave-native/releases/download/v1.0.9/dw-1.0.9-Windows.zip
2. Extract somewhere you have access to (recommended `%USERPROFILE%\.dw\`)
3. Add to path

#### Linux

Use either Mac approach, or manually install using Windows approach with this zip file: https://github.com/mulesoft-labs/data-weave-native/releases/download/v1.0.9/dw-1.0.9-Linux.zip

---