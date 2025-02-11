# Docker Bake Node.js Demo

This repository demonstrates how to use Docker Bake with a Node.js application.

## Usage

### Development Build
```bash
docker buildx bake app-dev
```

```
➜  docker-bake-nodejs-demo git:(main) docker images | grep docker-bake-demo
docker-bake-demo                            dev                                                                           2908208abee0   56 seconds ago   357MB
```

```
➜  docker-bake-nodejs-demo git:(main) docker run -d -p 3000:3000 docker-bake-demo:dev
1a6ff844fd8ce520d01de14bfee88e907d90f4c6f03c8a1ea643b164c2373fa0
```

```
➜  docker-bake-nodejs-demo git:(main) curl http://localhost:3000
{"message":"Hello from Docker Bake Demo!","env":"development"}%                                                             
```

### Production Build
```bash
docker buildx bake app-prod
```

### Multi-platform Build
```bash
docker buildx bake multi
```

See the blog post for detailed instructions and explanations.
