<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>TechCart - Create Seller Account</title>


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

        .register-section {
            min-height: calc(100vh - 72px);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 0;
        }

        .register-card {
            background-color: #ffffff;
            border-radius: 20px;
            padding: 40px;
            width: 100%;
            max-width: 500px;
            box-shadow: 0 10px 35px rgba(31, 84, 105, 0.12);
        }

        .register-icon {
            width: 75px;
            height: 75px;
            background-color: #dff5ff;
            color: #ff6b35;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            margin: 0 auto 20px;
        }

        .register-title {
            text-align: center;
            font-weight: 700;
            color: #24566b;
        }

        .register-subtitle {
            text-align: center;
            color: #6b8794;
            margin-bottom: 30px;
        }

        .form-label {
            font-weight: 600;
            color: #24566b;
        }

        .form-control {
            padding: 11px;
            border: 1px solid #b9ddea;
            border-radius: 8px;
        }

        .form-control:focus {
            border-color: #ff6b35;
            box-shadow: 0 0 0 0.2rem rgba(255, 107, 53, 0.15);
        }

        .btn-orange {
            background-color: #ff6b35;
            border-color: #ff6b35;
            color: #ffffff;
            font-weight: 600;
            border-radius: 8px;
            padding: 12px;
        }

        .btn-orange:hover {
            background-color: #e85a2a;
            border-color: #e85a2a;
            color: #ffffff;
        }

        .login-text {
            text-align: center;
            color: #6b8794;
            margin-top: 20px;
        }

        .login-text a {
            color: #ff6b35;
            font-weight: 600;
            text-decoration: none;
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

    </div>

</nav>


<!-- REGISTER -->

<section class="register-section">

    <div class="register-card">


        <div class="register-icon">

            <i class="bi bi-person-plus"></i>

        </div>


        <h2 class="register-title">
            Create Seller Account
        </h2>


        <p class="register-subtitle">
            Create an account to manage your products
        </p>


        <!-- ERROR -->

        <%
            if (request.getAttribute("error") != null) {
        %>

            <div class="alert alert-danger">

                <%= request.getAttribute("error") %>

            </div>

        <%
            }
        %>


        <form action="RegisterServlet"
              method="post">


            <div class="mb-3">

                <label class="form-label">
                    Full Name
                </label>

                <input type="text"
                       name="fullname"
                       class="form-control"
                       placeholder="Enter your full name"
                       required>

            </div>


            <div class="mb-3">

                <label class="form-label">
                    Email
                </label>

                <input type="email"
                       name="email"
                       class="form-control"
                       placeholder="Enter your email"
                       required>

            </div>


            <div class="mb-3">

                <label class="form-label">
                    Phone
                </label>

                <input type="tel"
                       name="phone"
                       class="form-control"
                       placeholder="Enter your phone number"
                       required>

            </div>


            <div class="mb-4">

                <label class="form-label">
                    Password
                </label>

                <input type="password"
                       name="password"
                       class="form-control"
                       placeholder="Create a password"
                       required>

            </div>


            <button type="submit"
                    class="btn btn-orange w-100">

                <i class="bi bi-person-plus"></i>

                Create Seller Account

            </button>


        </form>


        <div class="login-text">

            Already have an account?

            <a href="login.jsp">
                Seller Login
            </a>

        </div>


    </div>

</section>


</body>

</html>