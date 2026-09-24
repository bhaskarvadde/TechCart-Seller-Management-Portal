# 🛒 TechCart — Seller Management Portal

A Java-based web application that allows sellers to register, log in, and manage their products through a simple seller dashboard.

Built using **Java JSP, Servlets, JDBC, MySQL, Bootstrap, and Apache Tomcat**.

---

## 📌 Project Overview

**TechCart** is a seller-focused product management portal developed to understand and implement traditional Java web application architecture.

The application provides seller authentication and complete product CRUD functionality.

### Main Flow

```text
Seller Registration
        ↓
      Login
        ↓
     Dashboard
        ↓
 ┌──────┼──────────┐
 ↓      ↓          ↓
Add    Edit      Delete
 ↓      ↓          ↓
        Products
```

Each seller can manage only their own products.

---

## ✨ Features

### 👤 Seller Management

* Seller registration
* Seller login
* Session-based authentication
* Seller name displayed after login
* Logout functionality
* Protected dashboard and product pages

### 📦 Product Management

* Add new products
* View seller's products
* Edit existing products
* Delete products
* Product categories
* Product price and quantity management
* Product descriptions

### 🔐 Data Isolation

Products are associated with the logged-in seller using `seller_id`.

```sql
SELECT *
FROM products
WHERE seller_id = ?;
```

Update and delete operations also verify the seller ID.

---

## 🏗️ Architecture

TechCart follows an MVC-style layered architecture.

```text
                    ┌──────────────────┐
                    │     Browser      │
                    │    JSP / HTML    │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │     Servlet      │
                    │    Controller    │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │       DAO        │
                    │ Database Logic   │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │       JDBC       │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │      MySQL       │
                    └──────────────────┘
```

### Request Flow

```text
JSP
 ↓
Servlet
 ↓
Model
 ↓
DAO
 ↓
JDBC
 ↓
MySQL
 ↓
DAO
 ↓
Servlet
 ↓
JSP
```

---

## 📂 Project Structure

```text
TechCart/
│
├── src/
│   └── main/
│       └── java/
│           └── com/
│               └── techcart/
│                   │
│                   ├── controller/
│                   │   ├── LoginServlet.java
│                   │   ├── RegisterServlet.java
│                   │   ├── ProductServlet.java
│                   │   ├── AddProductServlet.java
│                   │   ├── EditProductServlet.java
│                   │   ├── DeleteProductServlet.java
│                   │   └── LogoutServlet.java
│                   │
│                   ├── dao/
│                   │   ├── UserDAO.java
│                   │   ├── UserDAOInterface.java
│                   │   └── ProductDAO.java
│                   │
│                   ├── model/
│                   │   ├── SellerModel.java
│                   │   ├── LoginModel.java
│                   │   └── ProductModel.java
│                   │
│                   └── util/
│                       └── DBConnection.java
│
├── WebContent/
│   ├── index.jsp
│   ├── login.jsp
│   ├── register.jsp
│   ├── dashboard.jsp
│   ├── add-product.jsp
│   ├── edit-product.jsp
│   │
│   └── WEB-INF/
│       └── lib/
│           └── mysql-connector-j.jar
│
├── SRS.md
├── README.md
├── .gitignore
├── .classpath
└── .project
```

---

## 🗄️ Database

TechCart uses **MySQL**.

### Database

```text
techcart_db
```

### Tables

```text
sellers
products
```

### Relationship

```text
             SELLER
                │
                │ 1
                │
                │
                │ *
                ▼
             PRODUCT
```

One seller can have multiple products.

### Sellers

| Column    | Type         | Description     |
| --------- | ------------ | --------------- |
| seller_id | INT          | Primary Key     |
| fullname  | VARCHAR(100) | Seller name     |
| email     | VARCHAR(100) | Unique email    |
| phone     | VARCHAR(15)  | Unique phone    |
| password  | VARCHAR(255) | Seller password |

### Products

| Column       | Type         | Description         |
| ------------ | ------------ | ------------------- |
| product_id   | INT          | Primary Key         |
| seller_id    | INT          | Foreign Key         |
| product_name | VARCHAR(100) | Product name        |
| category     | VARCHAR(50)  | Product category    |
| price        | DECIMAL      | Product price       |
| quantity     | INT          | Available quantity  |
| description  | VARCHAR(500) | Product description |

---

## 🔄 CRUD Operations

TechCart demonstrates complete CRUD operations.

| Operation | Feature               | SQL      |
| --------- | --------------------- | -------- |
| Create    | Add Seller / Product  | `INSERT` |
| Read      | Login / View Products | `SELECT` |
| Update    | Edit Product          | `UPDATE` |
| Delete    | Delete Product        | `DELETE` |

---

## 🛠️ Technologies Used

### Backend

* Java
* JSP
* Jakarta Servlets
* JDBC

### Frontend

* HTML
* CSS
* Bootstrap 5
* Bootstrap Icons
* JavaScript

### Database

* MySQL
* MySQL Connector/J

### Server

* Apache Tomcat

### IDE & Tools

* Eclipse IDE
* Git
* GitHub

---

# 🚀 Setup & Installation

## 1. Clone the Repository

```bash
git clone https://github.com/YOUR-USERNAME/TechCart-Seller-Management-Portal.git
```

Move into the project:

```bash
cd TechCart-Seller-Management-Portal
```

---

## 2. Import into Eclipse

Open Eclipse and import the project as:

```text
File
 → Import
 → General
 → Existing Projects into Workspace
```

Select the cloned TechCart project.

---

## 3. Configure MySQL

Create the database:

```sql
CREATE DATABASE techcart_db;
```

Select the database:

```sql
USE techcart_db;
```

Create the sellers table:

```sql
CREATE TABLE sellers (
    seller_id INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);
```

Create the products table:

```sql
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    seller_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    description VARCHAR(500),
    FOREIGN KEY (seller_id)
        REFERENCES sellers(seller_id)
);
```

---

## 4. Configure Database Connection

Open:

```text
src/main/java/com/techcart/util/DBConnection.java
```

Configure your local MySQL connection.

Example:

```java
DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/techcart_db",
    "root",
    "YOUR_PASSWORD"
);
```

> ⚠️ Do not commit your real database password to GitHub.

For a public repository, database credentials should be stored using environment variables or another secure configuration method.

---

## 5. Configure MySQL Connector/J

Make sure the MySQL Connector/J JAR is available to the Dynamic Web Project.

Expected location:

```text
WebContent/
└── WEB-INF/
    └── lib/
        └── mysql-connector-j.jar
```

---

## 6. Configure Apache Tomcat

Add Apache Tomcat to Eclipse.

The application was developed and tested using:

```text
Apache Tomcat
Java
Eclipse IDE
MySQL
```

Add the project to the Tomcat server.

---

## 7. Run the Application

Start the Tomcat server.

Open:

```text
http://localhost:8081/TechCart/
```

> The port may be different depending on your Tomcat configuration.

---

# 🖥️ Application Screenshots

Screenshots will be added here after capturing the final application screens.

### Home Page

![TechCart Home Page](screenshots/home.png)

### Seller Registration

![Seller Registration](screenshots/register.png)

### Seller Login

![Seller Login](screenshots/login.png)

### Seller Dashboard

![Seller Dashboard](screenshots/dashboard.png)

### Add Product

![Add Product](screenshots/add-product.png)

### Edit Product

![Edit Product](screenshots/edit-product.png)

---

# 🔐 Authentication Flow

```text
              Seller
                │
                ▼
        ┌─────────────────┐
        │     Login       │
        └────────┬────────┘
                 │
                 ▼
           LoginServlet
                 │
                 ▼
             UserDAO
                 │
                 ▼
              MySQL
                 │
          Valid Credentials?
             /       \
           Yes        No
            │          │
            ▼          ▼
         Session     Login Page
            │
            ▼
       ProductServlet
            │
            ▼
        Dashboard
```

The session stores:

```text
seller_id
sellerName
email
```

---

# 📦 Product Management Flow

```text
                    Dashboard
                        │
          ┌─────────────┼─────────────┐
          │             │             │
          ▼             ▼             ▼
       Add           Edit          Delete
          │             │             │
          ▼             ▼             ▼
   AddProductServlet  EditProductServlet  DeleteProductServlet
          │             │             │
          └─────────────┼─────────────┘
                        ▼
                    ProductDAO
                        │
                        ▼
                       JDBC
                        │
                        ▼
                      MySQL
```

---

# 🎨 UI Design

The application uses a consistent seller portal theme.

### Design Characteristics

* Light blue background
* Atomic Orange primary actions
* Dark blue navigation
* White content cards
* Bootstrap responsive layout
* Rounded cards and buttons
* Bootstrap Icons

Primary colors:

```text
Atomic Orange   #ff6b35
Hover Orange    #e85a2a
Ice Cream Blue  #dff5ff
Dark Blue       #24566b
Light Blue      #eaf8ff
Border          #b9ddea
```

---

# 📚 Learning Outcomes

This project provided practical experience with:

* Java web application development
* JSP
* Servlets
* JDBC
* MySQL
* CRUD operations
* DAO pattern
* Model classes
* HTTP request/response flow
* Session management
* Authentication
* Foreign keys
* MVC-style application structure
* Git and GitHub

---

# 🔮 Future Improvements

Possible future enhancements:

* Password hashing
* Environment-based database configuration
* Better server-side validation
* Admin dashboard
* Customer accounts
* Product search
* Product images
* Shopping cart
* Order management
* Payment integration
* Product reviews and ratings
* Pagination
* Cloud deployment
* HTTPS
* Connection pooling

---

# 📄 Documentation

Detailed software requirements and project specifications are available in:

**[SRS.md](SRS.md)**

---

# 👨‍💻 Author

**Bhaskar**

Java Full Stack Developer

---

## ⭐ Project Status

**Version:** 1.0
**Status:** Completed — Local Development Version
