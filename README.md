# DevContainers

- List of development containers for various programming languages

## Build

```shell
docker buildx build -t michibiki/devcontainer:golang-1.23-bullseye --platform=linux/amd64 --output=type=image,push=true -f Dockerfile.golang ./
docker buildx build -t michibiki/devcontainer:golang-1.23-nodejs-22-bullseye --platform=linux/amd64 --output=type=image,push=true -f Dockerfile.golang-nodejs ./
docker buildx build -t michibiki/devcontainer:hugo-0.139.2-bullseye --build-arg VERSION=0.139.2 --platform=linux/amd64 --output=type=image,push=true -f Dockerfile.hugo ./
docker buildx build -t michibiki/devcontainer:hugo-0.139.2-notejs-22-bullseye --build-arg VERSION=0.139.2 --platform=linux/amd64 --output=type=image,push=true -f Dockerfile.hugo-nodejs ./
docker buildx build -t michibiki/devcontainer:rust-1.82-bullseye --platform=linux/amd64 --output=type=image,push=true -f Dockerfile.rust ./
docker buildx build -t michibiki/devcontainer:rust-1.82-nodejs-22-bullseye --platform=linux/amd64 --output=type=image,push=true -f Dockerfile.rust-nodejs ./
```

## How to use

### Go(Golang)

```shell
docker run -d -p 18080:8080 --name (basename $PWD) --tty=true -e USERMAP_UID=(id -u staratlas) -e USERMAP_GIDS=(id -G staratlas) -v (pwd):/workspace -v /homes/staratlas/.gitconfig:/home/developer/.gitconfig:ro -v /homes/staratlas/.ssh:/home/developer/.ssh:ro --rm michibiki/devcontainer:golang-1.23-bullseye
```

### Go(Golang and nodejs)

```shell
docker run -d -p 18080:8080 --name (basename $PWD) --tty=true -e USERMAP_UID=(id -u staratlas) -e USERMAP_GIDS=(id -G staratlas) -v (pwd):/workspace -v /homes/staratlas/.gitconfig:/home/developer/.gitconfig:ro -v /homes/staratlas/.ssh:/home/developer/.ssh:ro --rm michibiki/devcontainer:golang-1.23-nodejs-22-bullseye
```

### Hugo

```shell
docker run -d -p 18080:18080 --name (basename $PWD) --tty=true -e USERMAP_UID=(id -u staratlas) -e USERMAP_GIDS=(id -G staratlas) -v (pwd):/workspace -v /homes/staratlas/.gitconfig:/home/developer/.gitconfig:ro -v /homes/staratlas/.ssh:/home/developer/.ssh:ro --rm michibiki/devcontainer:hugo-0.139.2-bullseye
```

### Hugo(Golang and nodejs)

```shell
docker run -d -p 18080:18080 -p 18081:8081 --name (basename $PWD) --tty=true -e USERMAP_UID=(id -u staratlas) -e USERMAP_GIDS=(id -G staratlas) -v (pwd):/workspace -v /homes/staratlas/.gitconfig:/home/developer/.gitconfig:ro -v /homes/staratlas/.ssh:/home/developer/.ssh:ro --rm michibiki/devcontainer:hugo-0.139.2-nodejs-22-bullseye
```

### Rust

```shell
docker run -d -p 18080:8080  --name (basename $PWD) --tty=true -e USERMAP_UID=(id -u staratlas) -e USERMAP_GIDS=(id -G staratlas) -v (pwd):/workspace -v /homes/staratlas/.gitconfig:/home/developer/.gitconfig:ro -v /homes/staratlas/.ssh:/home/developer/.ssh:ro --rm michibiki/devcontainer:rust-1.82-bullseye
```

### Rust(Rust and nodejs)

```shell
docker run -d -p 18080:8080  --name (basename $PWD) --tty=true -e USERMAP_UID=(id -u staratlas) -e USERMAP_GIDS=(id -G staratlas) -v (pwd):/workspace -v /homes/staratlas/.gitconfig:/home/developer/.gitconfig:ro -v /homes/staratlas/.ssh:/home/developer/.ssh:ro --rm michibiki/devcontainer:rust-1.82-nodejs-22-bullsey
```
