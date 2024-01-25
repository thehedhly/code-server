# code-server

![Build](https://github.com/thehedhly/code-server/actions/workflows/ci.yml/badge.svg?branch=dev)
![Docker build](https://github.com/thehedhly/code-server/actions/workflows/linter.yml/badge.svg?branch=dev)

<img src="https://upload.wikimedia.org/wikipedia/commons/9/9a/Visual_Studio_Code_1.35_icon.svg" width="100" height="100" alt="VS Code logo" />

## Features
- Builds [codercom/code-server](https://hub.docker.com/r/codercom/code-server) based docker __images__ with optional extensions installation support.

## Build arguments
| Name | description | default |
|------|---------|---------|
| `CODE_SERVER_VERSION` | Base code-server docker image tag. See [available tags](https://hub.docker.com/r/codercom/code-server/tags) | focal |

## Usage
As part of the build process, the `extensions.txt` file contains an optional list of VS Code extension IDs, where each line represents a unique VS Code extension ID.

### Build
```
docker build -t code-server:focal .
```
```
docker build --build-arg CODE_SERVER_VERSION=bookworm -t code-server:bookworm .
```
#### Run
```
docker run -it --rm --name code-server -p 8080:8080  --mount type=bind,source="$HOME/.config",target="/home/coder/.config" --mount type=bind,source="/mnt/vscode",target="/home/coder/vscode"  -u "$(id -u):$(id -g)" -e "DOCKER_USER=$USER" code-server:focal
```
```
docker run -it --rm --name code-server -p 8080:8080  --mount type=bind,source="$HOME/.config",target="/home/coder/.config" --mount type=bind,source="/mnt/vscode",target="/home/coder/vscode"  -u "$(id -u):$(id -g)" -e "DOCKER_USER=$USER" code-server:bookworm
```

## Source Reference
For the complete base image documentation and reference, please visit the [coder/code-server repository](https://github.com/coder/code-server).

This project was created by [H.Hedhly](https://hedhly.com).
