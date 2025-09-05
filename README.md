# PHP For Beginners by Laracasts

![PHP](https://img.shields.io/badge/PHP-8.2-blue) ![MySQL](https://img.shields.io/badge/MySQL-8-orange) ![Docker](https://img.shields.io/badge/Docker-✓-blue)

This project is a PHP application created following the course:

[PHP For Beginners 2023 Edition](https://laracasts.com/series/php-for-beginners-2023-edition) by Laracasts.

## Table of Contents

* [About](#about)
* [Docker](#docker)
* [Database](#database)
* [Usage](#usage)

## About

This is a beginner-friendly PHP project demonstrating CRUD operations with a MySQL database. It uses Docker for a consistent development environment.

## Docker

To run the project using Docker:

```bash
docker-compose up --build
```

This will start PHP and MySQL containers. Once running, you can access the app (if a web interface is included) via:

```
http://localhost:8000
```

*(Adjust the port if configured differently in your Docker setup.)*

## Database Tables

The project uses the following tables:

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

## Usage

1. Clone the repository:

```bash
git clone https://github.com/fahledu/mini-project-php-notes

```

2. Start Docker:

```bash
docker-compose up --build
```

3. Access the app at `http://localhost:8000` (if a web interface is included).

4. Execute SQL scripts to create tables if needed.