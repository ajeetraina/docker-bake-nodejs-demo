// Global variables
variable "NODE_ENV" {
    default = "production"
}

// Base group for shared settings
group "default" {
    targets = ["app"]
}

// Development group
group "dev" {
    targets = ["app-dev"]
}

// Production group
group "prod" {
    targets = ["app-prod"]
}

// Base target for shared configuration
target "docker-metadata" {
    tags = ["docker-bake-demo:latest"]
}

// Development target
target "app-dev" {
    inherits = ["docker-metadata"]
    dockerfile = "Dockerfile"
    target = "development"
    tags = ["docker-bake-demo:dev"]
    args = {
        NODE_ENV = "development"
    }
}

// Production target
target "app-prod" {
    inherits = ["docker-metadata"]
    dockerfile = "Dockerfile"
    target = "production"
    tags = ["docker-bake-demo:prod"]
    args = {
        NODE_ENV = "production"
    }
}

// Base application target
target "app" {
    inherits = ["docker-metadata"]
    dockerfile = "Dockerfile"
    args = {
        NODE_ENV = "${NODE_ENV}"
    }
}

// Multi-platform build target
target "multi" {
    inherits = ["app"]
    platforms = [
        "linux/amd64",
        "linux/arm64"
    ]
}