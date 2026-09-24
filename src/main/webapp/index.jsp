<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String sellerName = (String) session.getAttribute("sellerName");
    String email = (String) session.getAttribute("email");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>TechCart - Seller Portal</title>

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

        .nav-link {
            font-weight: 500;
            color: #24566b;
        }

        .nav-link:hover {
            color: #ff6b35;
        }

        .btn-orange {
            background-color: #ff6b35;
            border-color: #ff6b35;
            color: #ffffff;
            font-weight: 600;
            border-radius: 8px;
            padding: 10px 20px;
        }

        .btn-orange:hover {
            background-color: #e85a2a;
            border-color: #e85a2a;
            color: #ffffff;
        }

        .btn-outline-orange {
            border: 2px solid #ff6b35;
            color: #ff6b35;
            font-weight: 600;
            border-radius: 8px;
            padding: 9px 20px;
        }

        .btn-outline-orange:hover {
            background-color: #ff6b35;
            color: #ffffff;
        }

        .hero-section {
            min-height: calc(100vh - 72px);
            display: flex;
            align-items: center;
            padding: 70px 0;
        }

        .hero-content {
            max-width: 650px;
        }

        .hero-badge {
            display: inline-block;
            background-color: #dff5ff;
            color: #ff6b35;
            font-weight: 600;
            padding: 8px 16px;
            border-radius: 30px;
            margin-bottom: 20px;
        }

        .hero-title {
            font-size: 3.2rem;
            font-weight: 700;
            line-height: 1.2;
            color: #24566b;
        }

        .hero-title span {
            color: #ff6b35;
        }

        .hero-text {
            font-size: 1.1rem;
            color: #527587;
            line-height: 1.7;
            margin-top: 20px;
            margin-bottom: 30px;
        }

        .seller-card {
            background-color: #ffffff;
            border-radius: 20px;
            padding: 35px;
            box-shadow: 0 10px 35px rgba(31, 84, 105, 0.12);
            text-align: center;
        }

        .seller-icon {
            width: 90px;
            height: 90px;
            background-color: #dff5ff;
            color: #ff6b35;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.7rem;
            margin: 0 auto 20px;
        }

        .seller-card h3 {
            font-weight: 700;
            color: #24566b;
        }

        .seller-card p {
            color: #6b8794;
            margin-bottom: 25px;
        }

        .features-section {
            padding: 70px 0;
            background-color: #ffffff;
        }

        .section-title {
            text-align: center;
            font-weight: 700;
            color: #24566b;
            margin-bottom: 10px;
        }

        .section-subtitle {
            text-align: center;
            color: #6b8794;
            margin-bottom: 45px;
        }

        .feature-card {
            background-color: #f8fdff;
            border: 1px solid #dff5ff;
            border-radius: 15px;
            padding: 30px;
            height: 100%;
            text-align: center;
        }

        .feature-icon {
            width: 60px;
            height: 60px;
            background-color: #dff5ff;
            color: #ff6b35;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.6rem;
            margin: 0 auto 20px;
        }

        .feature-card h5 {
            font-weight: 700;
            color: #24566b;
        }

        .feature-card p {
            color: #6b8794;
            margin-bottom: 0;
        }

        footer {
            background-color: #24566b;
            color: #dff5ff;
            padding: 25px 0;
        }

        footer p {
            margin: 0;
        }

        @media (max-width: 768px) {

            .hero-title {
                font-size: 2.3rem;
            }

            .hero-section {
                text-align: center;
                padding: 50px 0;
            }

            .seller-card {
                margin-top: 40px;
            }

        }

    </style>

</head>


<body>


<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg">

    <div class="container">

        <a class="navbar-brand" href="index.jsp">
            Tech<span>Cart</span>
        </a>


        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarContent">

            <span class="navbar-toggler-icon"></span>

        </button>


        <div class="collapse navbar-collapse"
             id="navbarContent">

            <ul class="navbar-nav ms-auto align-items-lg-center gap-lg-2">


                <li class="nav-item">

                    <a class="nav-link"
                       href="index.jsp">

                        Home

                    </a>

                </li>


                <%
                    if (sellerName == null) {
                %>


                    <!-- BEFORE LOGIN -->

                    <li class="nav-item">

                        <a class="nav-link"
                           href="login.jsp">

                            Seller Login

                        </a>

                    </li>


                    <li class="nav-item">

                        <a class="btn btn-orange ms-lg-2"
                           href="register.jsp">

                            <i class="bi bi-person-plus"></i>

                            Create Seller Account

                        </a>

                    </li>


                <%
                    } else {
                %>


                    <!-- AFTER LOGIN -->

                    <li class="nav-item">

                        <a class="nav-link"
                           href="ProductServlet">

                            Dashboard

                        </a>

                    </li>


                    <li class="nav-item">

                        <span class="nav-link">

                            <i class="bi bi-person-circle"></i>

                            Welcome, <%= sellerName %>

                        </span>

                    </li>


                    <li class="nav-item">

                        <a class="btn btn-orange ms-lg-2"
                           href="LogoutServlet">

                            <i class="bi bi-box-arrow-right"></i>

                            Logout

                        </a>

                    </li>


                <%
                    }
                %>


            </ul>

        </div>

    </div>

</nav>


<!-- ================= HERO ================= -->

<section class="hero-section">

    <div class="container">

        <div class="row align-items-center">


            <div class="col-lg-7">

                <div class="hero-content">


                    <div class="hero-badge">

                        <i class="bi bi-shop"></i>

                        Seller Management Portal

                    </div>


                    <h1 class="hero-title">

                        Manage Your

                        <span>Products</span>

                        Easily

                    </h1>


                    <p class="hero-text">

                        TechCart is a simple seller portal that
                        helps you manage your products in one place.
                        Add products, update prices, change product
                        details and manage your inventory easily.

                    </p>


                    <%
                        if (sellerName == null) {
                    %>


                        <a href="register.jsp"
                           class="btn btn-orange me-2">

                            <i class="bi bi-person-plus"></i>

                            Create Seller Account

                        </a>


                        <a href="login.jsp"
                           class="btn btn-outline-orange">

                            <i class="bi bi-box-arrow-in-right"></i>

                            Seller Login

                        </a>


                    <%
                        } else {
                    %>


                        <a href="ProductServlet"
                           class="btn btn-orange">

                            <i class="bi bi-speedometer2"></i>

                            Go to Dashboard

                        </a>


                    <%
                        }
                    %>


                </div>

            </div>


            <!-- RIGHT SIDE CARD -->

            <div class="col-lg-5">

                <div class="seller-card">


                    <div class="seller-icon">

                        <i class="bi bi-shop"></i>

                    </div>


                    <h3>
                        Seller Portal
                    </h3>


                    <p>
                        Manage your products quickly and easily
                        from a single place.
                    </p>


                    <div class="text-start">


                        <p class="mb-3">

                            <i class="bi bi-check-circle-fill"
                               style="color:#ff6b35;"></i>

                            Add new products

                        </p>


                        <p class="mb-3">

                            <i class="bi bi-check-circle-fill"
                               style="color:#ff6b35;"></i>

                            Edit product information

                        </p>


                        <p class="mb-3">

                            <i class="bi bi-check-circle-fill"
                               style="color:#ff6b35;"></i>

                            Change product prices

                        </p>


                        <p class="mb-0">

                            <i class="bi bi-check-circle-fill"
                               style="color:#ff6b35;"></i>

                            Manage product inventory

                        </p>


                    </div>

                </div>

            </div>


        </div>

    </div>

</section>


<!-- ================= FEATURES ================= -->

<section class="features-section">

    <div class="container">


        <h2 class="section-title">
            Simple Product Management
        </h2>


        <p class="section-subtitle">
            Everything you need to manage your products
        </p>


        <div class="row g-4">


            <div class="col-md-4">

                <div class="feature-card">


                    <div class="feature-icon">

                        <i class="bi bi-plus-lg"></i>

                    </div>


                    <h5>
                        Add Products
                    </h5>


                    <p>

                        Add new products with their name,
                        category, price, quantity and description.

                    </p>


                </div>

            </div>


            <div class="col-md-4">

                <div class="feature-card">


                    <div class="feature-icon">

                        <i class="bi bi-pencil-square"></i>

                    </div>


                    <h5>
                        Edit Products
                    </h5>


                    <p>

                        Update product names, prices,
                        quantities and other information.

                    </p>


                </div>

            </div>


            <div class="col-md-4">

                <div class="feature-card">


                    <div class="feature-icon">

                        <i class="bi bi-box-seam"></i>

                    </div>


                    <h5>
                        Manage Inventory
                    </h5>


                    <p>

                        Keep your product information
                        and available quantities up to date.

                    </p>


                </div>

            </div>


        </div>

    </div>

</section>


<!-- ================= FOOTER ================= -->

<footer>

    <div class="container text-center">

        <p>

            © 2026 TechCart Seller Portal.
            All rights reserved.

        </p>

    </div>

</footer>


<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</body>

</html>