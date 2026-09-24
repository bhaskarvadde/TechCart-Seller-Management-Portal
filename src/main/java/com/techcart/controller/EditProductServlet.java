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

@WebServlet("/EditProductServlet")
public class EditProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;


    // =========================================================
    // GET
    // Used when clicking the Edit button
    // =========================================================

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

        // Get product ID from URL
        String id =
                request.getParameter("id");

        if (id == null) {

            response.sendRedirect("ProductServlet");
            return;
        }

        int productId =
                Integer.parseInt(id);

        // Get logged-in seller ID
        int sellerId =
                (Integer) session.getAttribute("seller_id");

        ProductDAO pd =
                new ProductDAO();

        // Get selected product from database
        ProductModel product =
                pd.getProductById(
                        productId,
                        sellerId);

        if (product != null) {

            // Send product to edit-product.jsp
            request.setAttribute(
                    "product",
                    product);

            request.getRequestDispatcher(
                    "edit-product.jsp")
                    .forward(request, response);

        } else {

            // Product not found
            response.sendRedirect(
                    "ProductServlet");
        }
    }


    // =========================================================
    // POST
    // Used when clicking Update Product
    // =========================================================

    protected void doPost(
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

        // Get logged-in seller ID
        int sellerId =
                (Integer) session.getAttribute("seller_id");

        // Get values from edit form
        int productId =
                Integer.parseInt(
                        request.getParameter(
                                "productId"));

        String productName =
                request.getParameter(
                        "productName");

        String category =
                request.getParameter(
                        "category");

        double price =
                Double.parseDouble(
                        request.getParameter(
                                "price"));

        int quantity =
                Integer.parseInt(
                        request.getParameter(
                                "quantity"));

        String description =
                request.getParameter(
                        "description");


        // Create ProductModel
        ProductModel product =
                new ProductModel();

        product.setProductId(productId);

        product.setSellerId(sellerId);

        product.setProductName(productName);

        product.setCategory(category);

        product.setPrice(price);

        product.setQuantity(quantity);

        product.setDescription(description);


        // Update product in database
        ProductDAO pd =
                new ProductDAO();

        pd.updateProduct(product);


        // Go back through ProductServlet
        // so dashboard gets refreshed product data
        response.sendRedirect(
                "ProductServlet");
    }
}