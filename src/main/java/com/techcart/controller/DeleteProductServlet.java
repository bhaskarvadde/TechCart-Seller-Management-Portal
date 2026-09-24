package com.techcart.controller;

import java.io.IOException;

import com.techcart.dao.ProductDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session == null ||
            session.getAttribute("seller_id") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        int sellerId =
                (Integer) session.getAttribute("seller_id");

        int productId =
                Integer.parseInt(
                        request.getParameter("id"));

        ProductDAO pd = new ProductDAO();

        // Delete only if product belongs to this seller
        pd.deleteProduct(productId, sellerId);

        response.sendRedirect("ProductServlet");
    }
}