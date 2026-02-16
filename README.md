# Dockerized Web Server & Infrastructure Lab

## Overview

This project is a hands-on laboratory focused on containerization, web server deployment, reverse proxy configuration, image security, and multi-container orchestration.

The lab progresses from running an official nginx image to building a custom Docker image for a FastCGI-based C web server, validating security with Dockle, and deploying a multi-container architecture using Docker Compose.

The tasks simulate real-world infrastructure workflows used in DevOps and platform engineering environments.

---

## Tech Stack

Containerization: Docker  
Orchestration: Docker Compose  
Web Server: Nginx  
Backend: C + FastCGI  
Security Scanning: Dockle  

---

## Repository Structure

README.md  
nginx/ — custom nginx configuration  
src/ — mini web server source code  
docker-compose.yml  
Dockerfile  

---

## Part 1 — Using the Official Nginx Image

### Goal
Become familiar with container lifecycle operations using a ready-made Docker image.

### Tasks
- Pull the official nginx image  
- Verify the image locally  
- Run the container in detached mode  
- Inspect container metadata  
- Identify:
  - container size  
  - mapped ports  
  - container IP  
- Stop and restart the container  
- Run nginx with ports 80 and 443 mapped to the host  
- Verify that the default nginx page is available at localhost:80  

### Skills Gained
- container lifecycle management  
- port mapping  
- container inspection  

Note: avoid committing large files (>10MB).

---

## Part 2 — Container Operations and Configuration

### Goal
Modify nginx configuration inside a container and preserve the environment.

### Tasks
- Read nginx.conf inside the container using exec  
- Create a custom nginx.conf locally  
- Configure a `/status` endpoint returning nginx server status  
- Copy configuration into the container  
- Restart nginx inside the container  
- Verify the status page at localhost:80/status  

### Image Portability
- Export the container to a tar archive  
- Remove the image  
- Delete the stopped container  
- Import the container back  
- Run the imported container and verify functionality  

### Skills Gained
- container file manipulation  
- configuration injection  
- container export/import  

---

## Part 3 — Mini Web Server (C + FastCGI)

### Goal
Build a lightweight backend service.

### Tasks
- Implement a FastCGI server in C returning "Hello, World!"  
- Run the server using spawn-fcgi on port 8080  
- Write a custom nginx configuration that proxies requests from port 81 to 127.0.0.1:8080  
- Launch nginx locally with this configuration  
- Verify that localhost:81 returns the custom page  

Store the nginx configuration at:

nginx/nginx.conf

### Skills Gained
- FastCGI fundamentals  
- reverse proxy configuration  
- backend integration  

---

## Part 4 — Building a Custom Docker Image

### Goal
Package the mini server and nginx into a single production-style container.

### Image Requirements
- Build FastCGI server from source  
- Run it on port 8080  
- Copy nginx configuration into the image  
- Start nginx automatically  

Use minimal RUN layers when writing the Dockerfile.

### Validation
- Build the image with a tag  
- Confirm it exists locally  
- Run the container mapping port 81 to port 80  
- Mount the nginx directory so configuration updates apply without rebuilding  
- Verify the server is reachable  
- Add `/status` proxying  
- Rebuild and confirm nginx status page works  

### Skills Gained
- Dockerfile optimization  
- containerized reverse proxy  
- runtime config mounting  

---

## Part 5 — Security Scanning with Dockle

### Goal
Validate container security posture.

### Tasks
- Scan the image using Dockle  
- Fix all warnings and errors  
- Re-scan until the image passes cleanly  

### Skills Gained
- container hardening  
- vulnerability awareness  
- secure image practices  

---

## Part 6 — Multi-Container Deployment with Docker Compose

### Goal
Deploy a small service architecture.

### Requirements
Create a docker-compose configuration that:

1. Runs the custom container from Part 5 on an internal network  
2. Starts a second nginx container acting as a reverse proxy  
3. Routes traffic from port 8080 to port 81 of the backend container  
4. Maps port 8080 of the proxy to port 80 on the host  

### Workflow
- Stop running containers  
- Build services with docker-compose build  
- Start the stack with docker-compose up  
- Verify that localhost:80 returns the custom page  

### Skills Gained
- service orchestration  
- container networking  
- reverse proxy architecture  

---

## What This Project Demonstrates

- practical Docker usage  
- custom image creation  
- reverse proxy design  
- container security scanning  
- multi-container deployment  
- infrastructure-level thinking  

---

## Safety Notes

Do not commit large artifacts such as container archives or binary dumps.

Keep images reproducible through Dockerfiles instead of exporting containers whenever possible.

---

