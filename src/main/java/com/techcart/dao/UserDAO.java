package com.techcart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.techcart.model.LoginModel;
import com.techcart.model.SellerModel;
import com.techcart.util.DBConnection;

public class UserDAO implements UserDAOInterface {

    // Login verification
    // Returns seller details if login is successful.
    // Returns null if login fails.
    @Override
    public SellerModel getUser(LoginModel lm) {

        SellerModel seller = null;

        try {

            // Get database connection
            Connection con = DBConnection.getConnection();

            // SQL query to check email and password
            String sql =
                    "SELECT seller_id, fullname, email " +
                    "FROM sellers " +
                    "WHERE email=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, lm.getEmail());
            ps.setString(2, lm.getPassword());

            ResultSet rs = ps.executeQuery();

            // If matching seller is found
            if (rs.next()) {

                seller = new SellerModel();

                seller.setSellerId(rs.getInt("seller_id"));
                seller.setFullname(rs.getString("fullname"));
                seller.setEmail(rs.getString("email"));
            }

            // Close connection
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return seller;
    }


    // Register a new seller
    @Override
    public boolean registerSeller(SellerModel seller) {

        boolean status = false;

        try {

            // Get database connection
            Connection con = DBConnection.getConnection();

            String sql =
                    "INSERT INTO sellers " +
                    "(fullname, email, phone, password) " +
                    "VALUES (?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, seller.getFullname());
            ps.setString(2, seller.getEmail());
            ps.setString(3, seller.getPhone());
            ps.setString(4, seller.getPassword());

            int rows = ps.executeUpdate();

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