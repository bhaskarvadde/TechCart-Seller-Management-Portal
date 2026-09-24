<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.techcart.model.ProductModel" %>


<%
    String sellerName =
            (String) session.getAttribute("sellerName");

    Integer sellerId =
            (Integer) session.getAttribute("seller_id");


    // Prevent direct access without login
    if (sellerName == null || sellerId == null) {

        response.sendRedirect("login.jsp");
        return;
    }


    List<ProductModel> products =
            (List<ProductModel>) request.getAttribute("products");
%>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>TechCart - Dashboard</title>


    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
        rel="stylesheet">


    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #eaf8ff;
            color: #24566b;
        }

        .navbar {
            background-color: #ffffff;
            box-shadow: 0 2px 12px rgba(31, 84, 105, 0.08);
        }

        .navbar-brand {
            font-size: 1.6rem;
            font-weight: bold;
            color: #24566b;
        }

        .navbar-brand span {
            color: #ff6b35;
        }

        .nav-link {
            font-weight: 500;
            color: #24566b;
        }

        .nav-link:hover {
            color: #ff6b35;
        }

        .dashboard-section {
            padding: 50px 0;
            min-height: calc(100vh - 72px);
        }

        .welcome-text {
            color: #6b8794;
        }

        .page-title {
            font-weight: 700;
            color: #24566b;
        }

        .btn-orange {
            background-color: #ff6b35;
            border-color: #ff6b35;
            color: #ffffff;
            font-weight: 600;
            border-radius: 8px;
            padding: 10px 18px;
        }

        .btn-orange:hover {
            background-color: #e85a2a;
            border-color: #e85a2a;
            color: #ffffff;
        }

        .search-box {
            background-color: #ffffff;
            border-radius: 12px;
            padding: 15px;
            box-shadow: 0 5px 20px rgba(31, 84, 105, 0.08);
            margin: 30px 0;
        }

        .search-box input {
            border: 1px solid #b9ddea;
            border-radius: 8px;
            padding: 12px;
        }

        .product-card {
            background-color: #ffffff;
            border-radius: 15px;
            padding: 25px;
            height: 100%;
            box-shadow: 0 5px 20px rgba(31, 84, 105, 0.08);
            transition: 0.2s;
        }

        .product-card:hover {
            transform: translateY(-3px);
        }

        .product-icon {
            width: 60px;
            height: 60px;
            background-color: #dff5ff;
            color: #ff6b35;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.7rem;
            margin-bottom: 18px;
        }

        .product-name {
            font-weight: 700;
            color: #24566b;
        }

        .category {
            color: #6b8794;
            font-size: 0.9rem;
        }

        .price {
            color: #ff6b35;
            font-size: 1.3rem;
            font-weight: 700;
        }

        .stock {
            color: #527587;
        }

        .description {
            color: #6b8794;
            min-height: 48px;
        }

        .btn-edit {
            border: 1px solid #ff6b35;
            color: #ff6b35;
            font-weight: 600;
            border-radius: 7px;
        }

        .btn-edit:hover {
            background-color: #ff6b35;
            color: #ffffff;
        }

        .empty-box {
            background-color: #ffffff;
            border-radius: 15px;
            padding: 60px 20px;
            text-align: center;
            box-shadow: 0 5px 20px rgba(31, 84, 105, 0.08);
        }

        .empty-icon {
            font-size: 3rem;
            color: #ff6b35;
            margin-bottom: 15px;
        }

    </style>

</head>


<body>


<!-- ================= NAVBAR ================= -->

<nav class="navbar">

    <div class="container">


        <a class="navbar-brand"
           href="index.jsp">

            Tech<span>Cart</span>

        </a>


        <div class="d-flex align-items-center gap-3">


            <a class="nav-link"
               href="index.jsp">

                Home

            </a>


            <a class="nav-link"
               href="ProductServlet">

                Dashboard

            </a>


            <span class="nav-link">

                <i class="bi bi-person-circle"></i>

                Welcome, <%= sellerName %>

            </span>


            <a class="btn btn-orange"
               href="LogoutServlet">

                <i class="bi bi-box-arrow-right"></i>

                Logout

            </a>


        </div>

    </div>

</nav>


<!-- ================= DASHBOARD ================= -->

<section class="dashboard-section">

    <div class="container">


        <!-- HEADER -->

        <div class="d-flex justify-content-between
                    align-items-center
                    flex-wrap gap-3">


            <div>

                <h1 class="page-title">
                    My Products
                </h1>

                <p class="welcome-text mb-0">

                    Manage your products, prices and inventory.

                </p>

            </div>


            <a href="add-product.jsp"
               class="btn btn-orange">

                <i class="bi bi-plus-lg"></i>

                Add Product

            </a>


        </div>


        <!-- SEARCH -->

        <div class="search-box">

            <div class="input-group">


                <span class="input-group-text bg-white">

                    <i class="bi bi-search"></i>

                </span>


                <input type="text"
                       id="searchInput"
                       class="form-control"
                       placeholder="Search your products...">


            </div>

        </div>


        <!-- PRODUCTS -->

        <div class="row g-4"
             id="productContainer">


        <%
            if (products != null && !products.isEmpty()) {

                for (ProductModel product : products) {
        %>


            <div class="col-md-6 col-lg-4 product-item">


                <div class="product-card">


                    <div class="product-icon">

                        <i class="bi bi-box-seam"></i>

                    </div>


                    <div class="category">

                        <%= product.getCategory() %>

                    </div>


                    <h4 class="product-name mt-1">

                        <%= product.getProductName() %>

                    </h4>


                    <div class="price mt-3">

                        ₹<%= product.getPrice() %>

                    </div>


                    <div class="stock mt-2">

                        <i class="bi bi-box"></i>

                        Stock:

                        <strong>
                            <%= product.getQuantity() %>
                        </strong>

                    </div>


                    <p class="description mt-3">

                        <%= product.getDescription() %>

                    </p>


                    <div class="d-flex gap-2 mt-3">


                        <a href="EditProductServlet?id=<%= product.getProductId() %>"
                           class="btn btn-edit flex-grow-1">

                            <i class="bi bi-pencil"></i>

                            Edit

                        </a>


                        <a href="DeleteProductServlet?id=<%= product.getProductId() %>"
                           class="btn btn-danger flex-grow-1"
                           onclick="return confirm('Are you sure you want to delete this product?');">

                            <i class="bi bi-trash"></i>

                            Delete

                        </a>


                    </div>


                </div>


            </div>


        <%
                }

            } else {
        %>


            <!-- NO PRODUCTS -->

            <div class="col-12">


                <div class="empty-box">


                    <div class="empty-icon">

                        <i class="bi bi-box-seam"></i>

                    </div>


                    <h3>
                        No Products Yet
                    </h3>


                    <p class="welcome-text">

                        Start by adding your first product.

                    </p>


                    <a href="add-product.jsp"
                       class="btn btn-orange">

                        <i class="bi bi-plus-lg"></i>

                        Add Product

                    </a>


                </div>


            </div>


        <%
            }
        %>


        </div>


    </div>

</section>


<!-- ================= SEARCH SCRIPT ================= -->

<script>

    const searchInput =
        document.getElementById("searchInput");


    searchInput.addEventListener("keyup", function () {


        const searchValue =
            this.value.toLowerCase();


        const products =
            document.querySelectorAll(".product-item");


        products.forEach(function(product) {


            const productText =
                product.innerText.toLowerCase();


            if (productText.includes(searchValue)) {

                product.style.display = "";

            } else {

                product.style.display = "none";

            }

        });

    });

</script>


</body>

</html>