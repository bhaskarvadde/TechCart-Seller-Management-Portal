package com.techcart.controller;

import java.io.IOException;

import com.techcart.dao.UserDAO;
import com.techcart.model.SellerModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        SellerModel seller = new SellerModel();

        seller.setFullname(fullname);
        seller.setEmail(email);
        seller.setPhone(phone);
        seller.setPassword(password);

        UserDAO ud = new UserDAO();

        boolean status = ud.registerSeller(seller);

        if (status) {

            request.setAttribute(
                    "success",
                    "Seller account created successfully. Please login.");

            RequestDispatcher rd =
                    request.getRequestDispatcher("login.jsp");

            rd.forward(request, response);

        } else {

            request.setAttribute(
                    "error",
                    "Registration failed. Email or phone may already exist.");

            RequestDispatcher rd =
                    request.getRequestDispatcher("register.jsp");

            rd.forward(request, response);
        }
    }
}