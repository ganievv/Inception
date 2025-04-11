# Inception

This repository contains the Inception Project — a system administration exercise focused on Docker technology. In this project, several Docker containers are built and orchestrated using Docker Compose on a Virtual Machine.

---

## Table of Contents

- [Introduction](#introduction)
- [Project Overview](#project-overview)
- [Technologies Used](#technologies-used)
- [Installation & Setup](#installation--setup)
- [Directory Structure](#directory-structure)
- [Security Considerations](#security-considerations)

---

## Introduction

The goal of the Inception Project is to expand system administration skills by working with Docker. This project requires you to build your own Docker images for each service, rather than relying on pre-built images from public repositories (with the exception of base images such as Alpine or Debian).

---

## Project Overview

In this project, the following services are set up in dedicated Docker containers:

- **NGINX Container:** Configured with TLSv1.2 or TLSv1.3 to act as the secure entry point.
- **WordPress Container:** Runs WordPress using php-fpm without an internal web server (NGINX is handled separately).
- **MariaDB Container:** Provides database services for WordPress.
- **Docker Volumes:** Two volumes are created—one for the WordPress database and a second for the WordPress website files.
- **Docker Network:** A custom network is established to enable communication between all containers.

All containers are configured to restart automatically in case of failure. The project is entirely orchestrated via a single `docker-compose.yml` file, which is automatically executed by the `Makefile` located at the repository root.

---

## Technologies Used

- **Docker & Docker Compose:** Containerization and orchestration of multi-container Docker applications.
- **NGINX:** Reverse proxy and TLS secured entry point.
- **WordPress with php-fpm:** Web publishing platform configured to work with a dedicated PHP service.
- **MariaDB:** Open-source relational database management system.
- **Alpine or Debian:** Base OS images used for creating lean and efficient Docker containers.
- **Shell and Make:** For scripting and automating build/deployment processes.

---

## Installation & Setup

### Prerequisites

- A **Virtual Machine** (VM) with a Linux distribution.
- **Docker** and **Docker Compose** installed on your system.
- Basic knowledge of Docker, networking, and system administration concepts.

### Setup Instructions

1. **Clone the repository:**

   ```bash
   git clone https://github.com/ganievv/Inception.git
   cd Inception
   ```

2. **Environment Variables:**

   - Create a `.env` file in the `srcs` directory to store your environment variables, including your custom domain (e.g., `yourlogin.42.fr`), MySQL configurations, etc.
   - Example content in `srcs/.env`:

     ```env
     DOMAIN_NAME=sganiev.42.fr
     TITLE=Inception
     WP_USER=regular-user-wp
     WP_USER_EMAIL=reg.u@gmail.com
     WP_ROOT_USER=root-user-wp
     WP_ROOT_USER_EMAIL=root.u@gmail.com
     DB_NAME=wordpress
     DB_HOST=mariadb
     DB_USER=regular-user-db
     DB_ROOT_USER=root-user-db
     ```
3. **Secrets Configuration:**

   - In addition to the environment file, you need to create several secret files for secure information storage. Create the following files inside the `secrets` folder (located one level above `srcs`), and make      sure to provide the necessary passwords in each file:

      -	db_password.txt – contains the password for the database user;
      -	db_root_password.txt - contains the root password for the MariaDB service;
      -	wp_password.txt - contains the password for the WordPress user;
      -	wp_root_password.txt - contains the root password for the WordPress service.

5. **Build:**

   - Simply run the provided Makefile to build your images and start your containers:
     
     ```bash
     make
     ```
  
     The `Makefile` is responsible for triggering the build of Docker images, configuration of volumes, network, and starting the entire infrastructure via `docker-compose`.

---

## Directory Structure

A typical directory structure for this project is as follows:

```
.
├── Makefile
├── secrets
│   ├── db_password.txt
│   └── db_root_password.txt
└── srcs
    ├── .env
    ├── docker-compose.yml
    └── requirements
        ├── nginx
        │   ├── Dockerfile
        │   ├── ...
        ├── wordpress
        │   ├── Dockerfile
        │   ├── ...
        └── mariadb
            ├── Dockerfile
            └── ...
```

## Security Considerations

- **Sensitive Information:** Avoid storing passwords, API keys, or credentials directly in your Dockerfiles or Git repository. Use a `.env` file and Docker secrets whenever possible.
- **Container Security:** Ensure that your containers are configured to restart in case of failure and follow best practices for writing Dockerfiles (e.g., avoiding the use of infinite loops or non-daemonized processes).
- **Network Restrictions:** Only allow secure entry points via NGINX using TLSv1.2 or TLSv1.3.
