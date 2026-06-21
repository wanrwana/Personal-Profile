package com.profile.controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    private final String DB_URL = "jdbc:derby://localhost:1527/StudentProfilesDB";
    private final String DB_USER = "app";
    private final String DB_PASS = "app";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("studentID");
        String name = request.getParameter("name");
        String prog = request.getParameter("programme");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String intro = request.getParameter("introduction");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
                String sql = "UPDATE STUDENTPROFILESDB SET name=?, programme=?, email=?, hobbies=?, introduction=? WHERE studentID=?";
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, name);
                    ps.setString(2, prog);
                    ps.setString(3, email);
                    ps.setString(4, hobbies);
                    ps.setString(5, intro);
                    ps.setString(6, id);
                    ps.executeUpdate();
                }
            }
            response.sendRedirect("ViewProfileServlet");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}