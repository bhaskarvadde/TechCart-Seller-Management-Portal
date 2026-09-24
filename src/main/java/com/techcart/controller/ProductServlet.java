package com.techcart.controller;

import java.io.IOException;
import java.util.List;

import com.techcart.dao.ProductDAO;
import com.techcart.model.ProductModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get existing session
        HttpSession session =
                request.getSession(false);

        // User must be logged in
        if (session == null ||
            session.getAttribute("seller_id") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        // Get logged-in seller ID from session
        int sellerId =
                (Integer) session.getAttribute("seller_id");

        ProductDAO pd = new ProductDAO();

        // Get only this seller's products
        List<ProductModel> products =
                pd.getProductsBySeller(sellerId);

        // Send products to dashboard.jsp
        request.setAttribute(
                "products",
                products);

        // Open dashboard
        request.getRequestDispatcher(
                "dashboard.jsp")
                .forward(request, response);
    }
}