package com.techcart.controller;

import java.io.IOException;

import com.techcart.dao.UserDAO;
import com.techcart.model.LoginModel;
import com.techcart.model.SellerModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        LoginModel lm = new LoginModel();

        lm.setEmail(email);
        lm.setPassword(password);

        UserDAO ud = new UserDAO();

        // Verify login and get seller details
        SellerModel seller = ud.getUser(lm);

        if (seller != null) {

            // Create/get the current session
            HttpSession session = request.getSession();

            // Store seller information in session
            session.setAttribute(
                    "seller_id",
                    seller.getSellerId());

            session.setAttribute(
                    "sellerName",
                    seller.getFullname());

            session.setAttribute(
                    "email",
                    seller.getEmail());

            // Go through ProductServlet.
            // ProductServlet will fetch existing products
            // from the database and then open dashboard.jsp.
            response.sendRedirect("ProductServlet");

        } else {

            // Login failed
            request.setAttribute(
                    "error",
                    "Invalid email or password.");

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                            "login.jsp");

            rd.forward(request, response);
        }
    }
}