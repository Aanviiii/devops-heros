# Docker Multi-Stage Build Homework

---

## Task 1: Multi-Stage Docker Build

### Docker Image Build

```bash
docker build -t docker-multistage-app .
```

### Run Container

```bash
docker run -d -p 8080:3000 --name multistage-container docker-multistage-app
```

---

## Application Running

### Screenshot

![website running](image-1.png)

---

## Running Container

### Command

```bash
docker ps
```

### Screenshot

![docker image](image.png)

---

## Task 3: Docker Application Deployment

Successfully deployed the following applications using Docker:

1. Node.js Application
2. Python Application
3. Java Application

### Screenshots

#### Node.js

![node-app](image-2.png)

#### Python

![python-app](image-3.png)

#### Java

![java-app](image-4.png)
