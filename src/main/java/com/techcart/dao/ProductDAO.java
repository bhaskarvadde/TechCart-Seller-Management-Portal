package com.techcart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.techcart.model.ProductModel;
import com.techcart.util.DBConnection;

public class ProductDAO {

    // =========================================================
    // GET ALL PRODUCTS OF LOGGED-IN SELLER
    // =========================================================

    public List<ProductModel> getProductsBySeller(int sellerId) {

        List<ProductModel> products =
                new ArrayList<>();

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "SELECT product_id, seller_id, product_name, " +
                    "category, price, quantity, description " +
                    "FROM products " +
                    "WHERE seller_id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, sellerId);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                ProductModel product =
                        new ProductModel();

                product.setProductId(
                        rs.getInt("product_id"));

                product.setSellerId(
                        rs.getInt("seller_id"));

                product.setProductName(
                        rs.getString("product_name"));

                product.setCategory(
                        rs.getString("category"));

                product.setPrice(
                        rs.getDouble("price"));

                product.setQuantity(
                        rs.getInt("quantity"));

                product.setDescription(
                        rs.getString("description"));

                products.add(product);
            }

            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return products;
    }


    // =========================================================
    // GET ONE PRODUCT FOR EDITING
    // =========================================================

    public ProductModel getProductById(
            int productId,
            int sellerId) {

        ProductModel product = null;

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "SELECT product_id, seller_id, product_name, " +
                    "category, price, quantity, description " +
                    "FROM products " +
                    "WHERE product_id=? AND seller_id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, productId);
            ps.setInt(2, sellerId);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                product =
                        new ProductModel();

                product.setProductId(
                        rs.getInt("product_id"));

                product.setSellerId(
                        rs.getInt("seller_id"));

                product.setProductName(
                        rs.getString("product_name"));

                product.setCategory(
                        rs.getString("category"));

                product.setPrice(
                        rs.getDouble("price"));

                product.setQuantity(
                        rs.getInt("quantity"));

                product.setDescription(
                        rs.getString("description"));
            }

            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return product;
    }


    // =========================================================
    // ADD PRODUCT
    // =========================================================

    public boolean addProduct(ProductModel product) {

        boolean status = false;

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "INSERT INTO products " +
                    "(seller_id, product_name, category, price, quantity, description) " +
                    "VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(
                    1,
                    product.getSellerId());

            ps.setString(
                    2,
                    product.getProductName());

            ps.setString(
                    3,
                    product.getCategory());

            ps.setDouble(
                    4,
                    product.getPrice());

            ps.setInt(
                    5,
                    product.getQuantity());

            ps.setString(
                    6,
                    product.getDescription());

            int rows =
                    ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }


    // =========================================================
    // UPDATE PRODUCT
    // =========================================================

    public boolean updateProduct(ProductModel product) {

        boolean status = false;

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "UPDATE products SET " +
                    "product_name=?, " +
                    "category=?, " +
                    "price=?, " +
                    "quantity=?, " +
                    "description=? " +
                    "WHERE product_id=? AND seller_id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(
                    1,
                    product.getProductName());

            ps.setString(
                    2,
                    product.getCategory());

            ps.setDouble(
                    3,
                    product.getPrice());

            ps.setInt(
                    4,
                    product.getQuantity());

            ps.setString(
                    5,
                    product.getDescription());

            ps.setInt(
                    6,
                    product.getProductId());

            ps.setInt(
                    7,
                    product.getSellerId());

            int rows =
                    ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }


    // =========================================================
    // DELETE PRODUCT
    // =========================================================

    public boolean deleteProduct(
            int productId,
            int sellerId) {

        boolean status = false;

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "DELETE FROM products " +
                    "WHERE product_id=? AND seller_id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, productId);
            ps.setInt(2, sellerId);

            int rows =
                    ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }
}