# PHP For Beginners by Laracasts

![PHP](https://img.shields.io/badge/PHP-8.2-blue) ![MySQL](https://img.shields.io/badge/MySQL-8-orange) ![Docker](https://img.shields.io/badge/Docker-✓-blue) ![License](https://img.shields.io/badge/License-MIT-green) ![Build](https://img.shields.io/badge/Build-passing-brightgreen)

This project is a PHP application created following the course:

[PHP For Beginners 2023 Edition](https://laracasts.com/series/php-for-beginners-2023-edition) by Laracasts.

---

## Table of Contents

* [About](#about)
* [Docker](#docker)
* [Database](#database)
* [Usage](#usage)


---

## About

This is a beginner-friendly PHP project demonstrating CRUD operations with a MySQL database. It uses Docker for a consistent development environment.

---

## Docker

To run the project using Docker:

```bash
docker-compose up --build
```

This will start PHP and MySQL containers. Once running, you can access the app via:

```
http://localhost:8080
```

*(Adjust the port if configured differently in your Docker setup.)*

### Notes on Dependencies

* The project uses Composer for PHP dependencies.
* When running via Docker, **Composer is already available in the container** (if configured in Dockerfile).
* If dependencies are not installed, you can install them inside the container:

```bash
docker-compose exec php bash
composer install
```

> ⚠️ No need to install PHP or Composer on your host machine if using Docker.

---

## Database Tables

```sql
-- Users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- Notes table
CREATE TABLE notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    body TEXT NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT fk_notes_user FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;
```

---

## Usage

1. Clone the repository:

```bash
git clone https://github.com/fahledu/mini-project-php-notes.git
cd mini-project-php-notes
```

2. Start Docker:

```bash
docker-compose up --build
```

3. Access the app at:

```
http://localhost:8080
```

4. If needed, install PHP dependencies inside the container:

```bash
docker-compose exec php bash
composer install
```

5. Execute SQL scripts to create tables if needed.

