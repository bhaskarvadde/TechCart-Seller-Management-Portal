package com.techcart.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get the existing session.
        // false means don't create a new session.
        HttpSession session =
                request.getSession(false);

        // Remove seller information from the session.
        if (session != null) {
            session.invalidate();
        }

        // Return to home page after logout.
        response.sendRedirect("index.jsp");
    }
}