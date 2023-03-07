# DevContainers

- List of development containers for various programming languages

## Build

```shel
docker buildx build -t michibiki/devcontainer:golang-1.19.5-bullseye --platform=linux/amd64 --output=type=image,push=true -f Dockerfile.golang ./
docker buildx build -t michibiki/devcontainer:golang-1.19.5-nodejs-16-bullseye --platform=linux/amd64 --output=type=image,push=true -f Dockerfile.golang-nodejs ./
docker buildx build -t michibiki/devcontainer:hugo-0.110.0-bullseye --build-arg VERSION=0.110.0 --platform=linux/amd64 --output=type=image,push=true -f Dockerfile.hugo ./
docker buildx build -t michibiki/devcontainer:hugo-0.110.0-notejs-16-bullseye --build-arg VERSION=0.110.0 --platform=linux/amd64 --output=type=image,push=true -f Dockerfile.hugo-nodejs ./
```

## How to use

### Rust

```shell
docker run -d -p 18080:8080  --name (basename $PWD) --tty=true -e USERMAP_UID=(id -u staratlas) -e USERMAP_GIDS=(id -G staratlas) -v (pwd):/workspace -v /homes/staratlas/.gitconfig:/home/developer/.gitconfig:ro -v /homes/staratlas/.ssh:/home/developer/.ssh:ro --rm michibiki/devcontainer:rust-1.66-buster
```

### Go(Golang)

```shell
docker run -d -p 18080:8080 --name (basename $PWD) --tty=true -e USERMAP_UID=(id -u staratlas) -e USERMAP_GIDS=(id -G staratlas) -v (pwd):/workspace -v /homes/staratlas/.gitconfig:/home/developer/.gitconfig:ro -v /homes/staratlas/.ssh:/home/developer/.ssh:ro --rm michibiki/devcontainer:golang-1.19.5-bullseye
```

### Go(Golang and nodejs)

```shell
docker run -d -p 18080:8080 --name (basename $PWD) --tty=true -e USERMAP_UID=(id -u staratlas) -e USERMAP_GIDS=(id -G staratlas) -v (pwd):/workspace -v /homes/staratlas/.gitconfig:/home/developer/.gitconfig:ro -v /homes/staratlas/.ssh:/home/developer/.ssh:ro --rm michibiki/devcontainer:golang-1.19.5-nodejs-16-bullseye
```

### Hugo

```shell
docker run -d -p 18080:18080 --name (basename $PWD) --tty=true -e USERMAP_UID=(id -u staratlas) -e USERMAP_GIDS=(id -G staratlas) -v (pwd):/workspace -v /homes/staratlas/.gitconfig:/home/developer/.gitconfig:ro -v /homes/staratlas/.ssh:/home/developer/.ssh:ro --rm michibiki/devcontainer:hugo-0.110.0-bullseye
```

### Hugo(Golang and nodejs)

```shell
docker run -d -p 18080:18080 -p 18081:8081 --name (basename $PWD) --tty=true -e USERMAP_UID=(id -u staratlas) -e USERMAP_GIDS=(id -G staratlas) -v (pwd):/workspace -v /homes/staratlas/.gitconfig:/home/developer/.gitconfig:ro -v /homes/staratlas/.ssh:/home/developer/.ssh:ro --rm michibiki/devcontainer:hugo-0.110.0-nodejs-16-bullseye
```
