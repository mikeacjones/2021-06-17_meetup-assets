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

# Sample DataWeave Module

The sample DataWeave module, located in [/dw-module-jwt](/dw-module-jwt), demonstrates how to create a maven project specifically for a reusable DataWeave library. While this was created using [the IntelliJ plugin](https://plugins.jetbrains.com/plugin/10362-dataweave-2-0-), the same project can be worked on via Studio without any issue. You simple need to update the POM with the appropriate build plugins and dependencies. Line-break debugging is currently only available via the IntelliJ plugin, but be aware that the IntelliJ plugin is an "as is" plugin without support.

#### Publishing Module to Exchange

Publishing maven artifacts to Exchange, outside of the custom artifact classifiers available via the `mule-maven-plugin`, is possible but not officially supported. In order to publish a maven asset to Exchange (it will NOT be visible in exchange, only usable as a dependency), you will need to modify your POM in the following ways:

Set groupID to your organizationID:

```xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">

    <modelVersion>4.0.0</modelVersion>

    <groupId>ORGANIZATION_ID</groupId>
    ...
```

Add a distribution management entry with the exchange endpoint, with your oganizationID, as the target:

```xml
    <distributionManagement>
        <repository>
            <id>exchange-repository</id>
            <url>https://maven.anypoint.mulesoft.com/api/v2/organizations/ORGANIZATION_ID/maven</url>
            <layout>default</layout>
        </repository>
    </distributionManagement>
```

Note that you will need to provide credentials for the repository in order to push artifacts. This will typically be done either as a secret in a CI pipeline, or can be done in your `~/.m2/settings.xml` file using a server entry that corresponds to the ID you set for the repository.