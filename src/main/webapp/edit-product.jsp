<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.techcart.model.ProductModel" %>


<%
    String sellerName =
            (String) session.getAttribute("sellerName");

    Integer sellerId =
            (Integer) session.getAttribute("seller_id");


    // Only logged-in sellers can edit products
    if (sellerName == null || sellerId == null) {

        response.sendRedirect("login.jsp");
        return;
    }


    // Get product sent by EditProductServlet
    ProductModel product =
            (ProductModel) request.getAttribute("product");


    // If product is not available, go back to dashboard
    if (product == null) {

        response.sendRedirect("ProductServlet");
        return;
    }
%>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>TechCart - Edit Product</title>


    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
        rel="stylesheet">


    <style>

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #eaf8ff, #ffffff);
            min-height: 100vh;
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

        .form-section {
            padding: 50px 0;
            min-height: calc(100vh - 72px);
        }

        .form-card {
            background-color: #ffffff;
            border-radius: 20px;
            padding: 40px;
            max-width: 650px;
            margin: auto;
            box-shadow: 0 10px 35px rgba(31, 84, 105, 0.12);
        }

        .page-title {
            color: #24566b;
            font-weight: 700;
        }

        .subtitle {
            color: #6b8794;
        }

        .form-label {
            color: #24566b;
            font-weight: 600;
        }

        .form-control,
        .form-select {
            border: 1px solid #b9ddea;
            border-radius: 8px;
            padding: 11px;
        }

        .form-control:focus,
        .form-select:focus {
            border-color: #ff6b35;
            box-shadow: 0 0 0 0.2rem rgba(255, 107, 53, 0.15);
        }

        .btn-orange {
            background-color: #ff6b35;
            border-color: #ff6b35;
            color: #ffffff;
            font-weight: 600;
            border-radius: 8px;
            padding: 11px 20px;
        }

        .btn-orange:hover {
            background-color: #e85a2a;
            border-color: #e85a2a;
            color: #ffffff;
        }

        .btn-cancel {
            border: 1px solid #b9ddea;
            color: #527587;
            border-radius: 8px;
            padding: 11px 20px;
        }

    </style>

</head>


<body>


<!-- NAVBAR -->

<nav class="navbar">

    <div class="container">

        <a class="navbar-brand"
           href="index.jsp">

            Tech<span>Cart</span>

        </a>


        <div class="d-flex align-items-center gap-3">

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

                Logout

            </a>

        </div>

    </div>

</nav>


<!-- FORM -->

<section class="form-section">

    <div class="container">

        <div class="form-card">

            <h2 class="page-title">
                Edit Product
            </h2>


            <p class="subtitle mb-4">

                Update your product information.

            </p>


            <form action="EditProductServlet"
                  method="post">


                <!-- PRODUCT ID -->

                <input type="hidden"
                       name="productId"
                       value="<%= product.getProductId() %>">


                <!-- PRODUCT NAME -->

                <div class="mb-3">

                    <label class="form-label">
                        Product Name
                    </label>

                    <input type="text"
                           name="productName"
                           class="form-control"
                           value="<%= product.getProductName() %>"
                           required>

                </div>


                <!-- CATEGORY -->

                <div class="mb-3">

                    <label class="form-label">
                        Category
                    </label>

                    <select name="category"
                            class="form-select"
                            required>

                        <option value="Electronics"
                            <%= "Electronics".equals(product.getCategory()) ? "selected" : "" %>>
                            Electronics
                        </option>

                        <option value="Mobiles"
                            <%= "Mobiles".equals(product.getCategory()) ? "selected" : "" %>>
                            Mobiles
                        </option>

                        <option value="Laptops"
                            <%= "Laptops".equals(product.getCategory()) ? "selected" : "" %>>
                            Laptops
                        </option>

                        <option value="Accessories"
                            <%= "Accessories".equals(product.getCategory()) ? "selected" : "" %>>
                            Accessories
                        </option>

                        <option value="Home Appliances"
                            <%= "Home Appliances".equals(product.getCategory()) ? "selected" : "" %>>
                            Home Appliances
                        </option>

                        <option value="Other"
                            <%= "Other".equals(product.getCategory()) ? "selected" : "" %>>
                            Other
                        </option>

                    </select>

                </div>


                <!-- PRICE + QUANTITY -->

                <div class="row">

                    <div class="col-md-6 mb-3">

                        <label class="form-label">
                            Price
                        </label>

                        <input type="number"
                               name="price"
                               class="form-control"
                               step="0.01"
                               min="0"
                               value="<%= product.getPrice() %>"
                               required>

                    </div>


                    <div class="col-md-6 mb-3">

                        <label class="form-label">
                            Quantity
                        </label>

                        <input type="number"
                               name="quantity"
                               class="form-control"
                               min="0"
                               value="<%= product.getQuantity() %>"
                               required>

                    </div>

                </div>


                <!-- DESCRIPTION -->

                <div class="mb-4">

                    <label class="form-label">
                        Description
                    </label>

                    <textarea name="description"
                              class="form-control"
                              rows="4"
                              placeholder="Enter product description"><%= product.getDescription() %></textarea>

                </div>


                <!-- BUTTONS -->

                <div class="d-flex gap-2">

                    <a href="ProductServlet"
                       class="btn btn-cancel">

                        Cancel

                    </a>


                    <button type="submit"
                            class="btn btn-orange">

                        <i class="bi bi-check-lg"></i>

                        Update Product

                    </button>

                </div>


            </form>

        </div>

    </div>

</section>


</body>

</html>