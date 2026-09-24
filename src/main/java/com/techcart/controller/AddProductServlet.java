package com.techcart.controller;

import java.io.IOException;

import com.techcart.dao.ProductDAO;
import com.techcart.model.ProductModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(
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

        String productName =
                request.getParameter("productName");

        String category =
                request.getParameter("category");

        double price =
                Double.parseDouble(
                        request.getParameter("price"));

        int quantity =
                Integer.parseInt(
                        request.getParameter("quantity"));

        String description =
                request.getParameter("description");

        ProductModel product =
                new ProductModel();

        product.setSellerId(sellerId);
        product.setProductName(productName);
        product.setCategory(category);
        product.setPrice(price);
        product.setQuantity(quantity);
        product.setDescription(description);

        ProductDAO pd = new ProductDAO();

        pd.addProduct(product);

        // Return to dashboard after adding product
        response.sendRedirect("ProductServlet");
    }
}