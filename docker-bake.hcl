variable "NODE_ENV" {
    default = "production"
}

group "default" {
    targets = ["app"]
}

group "dev" {
    targets = ["app-dev"]
}

group "prod" {
    targets = ["app-prod"]
}

target "docker-metadata" {
    tags = ["docker-bake-demo:latest"]
}

target "app-dev" {
    inherits = ["docker-metadata"]
    dockerfile = "Dockerfile"
    target = "development"
    tags = ["docker-bake-demo:dev"]
    args = {
        NODE_ENV = "development"
    }
}

target "app-prod" {
    inherits = ["docker-metadata"]
    dockerfile = "Dockerfile"
    target = "production"
    tags = ["docker-bake-demo:prod"]
    args = {
        NODE_ENV = "production"
    }
}

target "app" {
    inherits = ["docker-metadata"]
    dockerfile = "Dockerfile"
    args = {
        NODE_ENV = "${NODE_ENV}"
    }
}

target "multi" {
    inherits = ["app"]
    platforms = [
        "linux/amd64",
        "linux/arm64"
    ]
}