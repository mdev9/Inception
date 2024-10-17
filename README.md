# 🚀 Inception – Virtualized Infrastructure Setup 🌐

Welcome to **Inception**, an exciting project that builds a fully virtualized infrastructure with Docker 🐳! This project includes a secure, isolated environment where a **WordPress site** 🌟 is powered by **NGINX** ⚡ and **MySQL** 🛢️. Everything is managed with **Docker Compose** 🛠️ for easy orchestration!

## 📝 Project Overview

This project was created as part of a challenge to set up an infrastructure using **Docker** and other virtualization technologies. You’ll get a fully configured WordPress website running on NGINX, connected securely to a MySQL database, with everything neatly contained in Docker containers. 🧩

### Features:
- 🔹 **WordPress** installation for content management
- 🔹 **NGINX** for web server handling
- 🔹 **MySQL** database configuration
- 🔹 Secure communication between containers
- 🔹 Managed with **Docker Compose** for easy setup

## 🛠️ Installation & Setup

To get started, follow these steps to clone and run the project:

   ```bash
    git clone https://github.com/mdev9/Inception.git
    cd Inception
    make
   ```

That’s it! 🎉 Your virtualized infrastructure is up and running! 🚀

Access the WordPress site by navigating to:
  ```bash
  https://localhost
  ```

## 📂 Project Structure

  ```bash
    inception/
    │
    ├── docker-compose.yml   # Docker Compose file for orchestrating services
    ├── nginx/               # NGINX configuration
    ├── wordpress/           # WordPress configuration
    ├── mysql/               # MySQL database configuration
    └── README.md            # You're here! 👋

inception/
│
├── Makefile
├── README.md                # You're here! 👋
└── srcs/
    ├── docker-compose.yml   # Docker Compose file for orchestrating services
    └── requirements/
        ├── mariadb/         # MySQL database configuration
        │   ├── Dockerfile
        │   └── conf/
        │       ├── 50-server.cnf
        │       └── init-db.sh
        ├── nginx/           # NGINX configuration
        │   ├── Dockerfile
        │   └── conf/
        │       └── nginx.conf
        └── wordpress/       # WordPress configuration
            ├── Dockerfile
            └── conf/
                └── config.sh
  ```

## 🔍 Technologies Used

- Docker 🐳: Containerization platform to create isolated environments.
- Docker Compose ⚙️: Tool for defining and running multi-container Docker applications.
- NGINX 🌐: Web server to handle requests and serve the WordPress site.
- MySQL 🛢️: The database to store all your WordPress content.

## 🎯 Goals of the Project

The goal of this project is to:

- Set up a secure, containerized infrastructure.
- Use modern tools like Docker and NGINX to deploy web applications.
- Build familiarity with Docker Compose for multi-container environments.

Thank you for checking out Inception! 🚀 Happy coding! 💻
