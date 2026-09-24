# TechCart — Seller Management Portal

## Software Requirements Specification (SRS)

**Project Name:** TechCart
**Project Type:** Web-Based Seller Product Management Portal
**Version:** 1.0
**Technology:** Java, JSP, Servlets, JDBC, MySQL, Bootstrap
**Server:** Apache Tomcat

---

# 1. Introduction

## 1.1 Project Overview

TechCart is a web-based seller management portal developed using Java JSP, Servlets, JDBC, and MySQL.

The application allows sellers to create an account, log in securely, and manage their products through a simple web interface.

The system follows the MVC-style separation of responsibilities using JSP pages for the user interface, Servlets for request handling, DAO classes for database operations, model classes for data representation, and JDBC for database connectivity.

---

## 1.2 Purpose

The purpose of TechCart is to provide a simple platform where sellers can manage their product information.

The application demonstrates the complete flow of a traditional Java web application:

```text
JSP
 ↓
Servlet
 ↓
DAO
 ↓
JDBC
 ↓
MySQL
```

It is also designed as a learning project to understand Java web development concepts such as:

* JSP
* Servlets
* JDBC
* MVC architecture
* HTTP request and response handling
* Session management
* CRUD operations
* MySQL database connectivity

---

# 2. Objectives

The main objectives of TechCart are:

1. Allow sellers to register an account.
2. Allow registered sellers to log in.
3. Maintain seller login information using HTTP sessions.
4. Allow sellers to add products.
5. Allow sellers to view their products.
6. Allow sellers to edit existing products.
7. Allow sellers to delete products.
8. Ensure sellers can manage only their own products.
9. Store seller and product information in MySQL.
10. Provide a simple and responsive user interface.

---

# 3. Scope

## 3.1 Included Features

The current version of TechCart includes:

* Seller registration
* Seller login
* Session management
* Seller dashboard
* Product creation
* Product listing
* Product editing
* Product deletion
* Logout
* MySQL database storage
* Seller-specific product management

## 3.2 Out of Scope

The current version does not include:

* Customer accounts
* Shopping cart
* Online payments
* Order management
* Product purchasing
* Product reviews
* Product ratings
* Admin dashboard
* Online deployment

These features may be considered for future versions.

---

# 4. User Roles

## 4.1 Seller

The seller is the primary user of the system.

A seller can:

* Register an account
* Log in
* View their dashboard
* Add products
* View their products
* Edit their products
* Delete their products
* Log out

---

# 5. Functional Requirements

## FR-01: Seller Registration

The system shall allow a new seller to create an account.

Required information:

* Full name
* Email
* Phone number
* Password

The system shall store the seller information in the `sellers` table.

Email and phone number are unique.

---

## FR-02: Seller Login

The system shall allow registered sellers to log in using:

* Email
* Password

The system shall verify the credentials against the database.

If the credentials are valid, a session shall be created.

The session stores:

```text
seller_id
sellerName
email
```

If the credentials are invalid, the system shall display an appropriate error message.

---

## FR-03: Seller Dashboard

After successful login, the seller shall be redirected to the dashboard.

The dashboard shall display products belonging to the logged-in seller.

The dashboard shall provide options to:

* Add Product
* Edit Product
* Delete Product
* Logout

---

## FR-04: Add Product

The seller shall be able to add a new product.

Product information includes:

* Product name
* Category
* Price
* Quantity
* Description

The product shall be associated with the currently logged-in seller using `seller_id`.

---

## FR-05: View Products

The system shall display products belonging to the logged-in seller.

The application shall retrieve products using the seller's ID.

Example query:

```sql
SELECT *
FROM products
WHERE seller_id = ?;
```

A seller shall not normally see products belonging to another seller.

---

## FR-06: Edit Product

The seller shall be able to edit an existing product.

When the seller selects **Edit**, the system shall:

1. Receive the product ID.
2. Identify the logged-in seller.
3. Retrieve the corresponding product.
4. Display the existing product information.
5. Allow the seller to modify the information.
6. Update the product in the database.

---

## FR-07: Delete Product

The seller shall be able to delete their products.

The system shall identify the product using:

```text
product_id
seller_id
```

This ensures that a seller cannot delete another seller's product through the normal application flow.

---

## FR-08: Logout

The seller shall be able to log out of the application.

When logout is performed:

1. The current HTTP session shall be invalidated.
2. The seller shall be redirected to the home page.

---

# 6. Non-Functional Requirements

## 6.1 Usability

The application should provide a simple and easy-to-understand interface.

The UI uses:

* Bootstrap
* Bootstrap Icons
* Responsive layouts
* Consistent navigation
* Form validation

---

## 6.2 Performance

Database operations should use `PreparedStatement`.

Product queries should retrieve only the products belonging to the logged-in seller.

---

## 6.3 Security

The application uses session-based authentication.

Seller-specific database operations use both:

```text
product_id
seller_id
```

to help prevent unauthorized access to another seller's products.

Database credentials should not be exposed in publicly shared source code.

---

## 6.4 Maintainability

The application separates responsibilities into different packages:

```text
controller
dao
model
util
```

This makes the code easier to understand and maintain.

---

# 7. System Architecture

TechCart follows a layered MVC-style architecture.

```text
                 ┌─────────────────┐
                 │     Browser     │
                 │   JSP / HTML    │
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │    Servlet      │
                 │   Controller    │
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │      DAO        │
                 │ Database Logic  │
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │      JDBC       │
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │     MySQL       │
                 │    Database     │
                 └─────────────────┘
```

---

# 8. Application Flow

## 8.1 Registration Flow

```text
register.jsp
     ↓
RegisterServlet
     ↓
SellerModel
     ↓
UserDAO
     ↓
JDBC
     ↓
MySQL
     ↓
sellers table
```

---

## 8.2 Login Flow

```text
login.jsp
     ↓
LoginServlet
     ↓
LoginModel
     ↓
UserDAO
     ↓
MySQL
     ↓
SellerModel
     ↓
HTTP Session
     ↓
ProductServlet
     ↓
dashboard.jsp
```

---

## 8.3 Product Management Flow

```text
dashboard.jsp
     │
     ├── Add
     │     ↓
     │  AddProductServlet
     │     ↓
     │  ProductDAO
     │     ↓
     │  MySQL
     │
     ├── Edit
     │     ↓
     │  EditProductServlet
     │     ↓
     │  ProductDAO
     │     ↓
     │  MySQL
     │
     └── Delete
           ↓
       DeleteProductServlet
           ↓
       ProductDAO
           ↓
          MySQL
```

---

# 9. Project Structure

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
├── .gitignore
├── .classpath
└── .project
```

---

# 10. Database Design

The application uses a MySQL database named:

```text
techcart_db
```

## 10.1 Sellers Table

```sql
CREATE TABLE sellers (
    seller_id INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);
```

---

## 10.2 Products Table

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

# 11. Database Relationship

One seller can have multiple products.

```text
          SELLERS
     ┌────────────────┐
     │ seller_id (PK) │
     │ fullname       │
     │ email          │
     │ phone          │
     │ password       │
     └───────┬────────┘
             │
             │ 1 : Many
             │
     ┌───────▼────────┐
     │    PRODUCTS    │
     │ product_id PK  │
     │ seller_id FK   │
     │ product_name   │
     │ category       │
     │ price          │
     │ quantity       │
     │ description    │
     └────────────────┘
```

---

# 12. CRUD Operations

TechCart demonstrates all major database CRUD operations.

| Operation | Function                 | Database Operation |
| --------- | ------------------------ | ------------------ |
| Create    | Add Seller / Add Product | INSERT             |
| Read      | Login / View Products    | SELECT             |
| Update    | Edit Product             | UPDATE             |
| Delete    | Delete Product           | DELETE             |

---

# 13. Technologies Used

## Backend

* Java
* Jakarta Servlets
* JSP
* JDBC

## Database

* MySQL

## Frontend

* HTML
* CSS
* Bootstrap
* Bootstrap Icons
* JavaScript for basic interactions

## Server

* Apache Tomcat

## Development Environment

* Eclipse IDE
* MySQL
* Git
* GitHub

---

# 14. User Interface

The application uses a consistent seller portal design.

Main visual characteristics include:

* Light blue background
* Orange primary actions
* Dark blue navigation elements
* White content cards
* Bootstrap responsive layout
* Rounded components
* Bootstrap Icons

Main pages:

```text
Home
 ↓
Seller Login
 ↓
Seller Dashboard
 ├── Add Product
 ├── Edit Product
 ├── Delete Product
 └── Logout
```

---

# 15. Error Handling

The application handles common errors such as:

* Invalid login credentials
* Missing session
* Invalid product ID
* Database connection failures
* Invalid requests

Unauthenticated users attempting to access protected pages are redirected to the login page.

---

# 16. Future Enhancements

Possible future improvements include:

* Password hashing
* Environment-based database configuration
* Input validation
* Admin management
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
* Improved exception handling
* Connection pooling

---

# 17. Project Outcome

TechCart demonstrates the development of a complete Java web application using JSP, Servlets, JDBC, and MySQL.

The project provides practical understanding of:

```text
Client Request
      ↓
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
Response
```

The project also demonstrates authentication, session management, database relationships, and complete product CRUD functionality.

---

# 18. Conclusion

TechCart is a seller-focused product management portal designed to demonstrate fundamental Java web development concepts.

The application provides a complete workflow from seller registration and authentication to product creation, retrieval, modification, and deletion.

The project serves as a practical implementation of JSP, Servlets, JDBC, MySQL, and MVC-style application organization.
