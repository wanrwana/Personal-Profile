package com.profile.controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.profile.model.ProfileBean;

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
    private final String DB_URL = "jdbc:derby://localhost:1527/StudentProfilesDB";
    private final String DB_USER = "app";
    private final String DB_PASS = "app";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("studentID");
        ProfileBean p = null;
        
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
                String sql = "SELECT * FROM STUDENTPROFILESDB WHERE studentID = ?";
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, id);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            p = new ProfileBean();
                            p.setStudentID(rs.getString("studentID"));
                            p.setName(rs.getString("name"));
                            p.setProgramme(rs.getString("programme"));
                            p.setEmail(rs.getString("email"));
                            p.setHobbies(rs.getString("hobbies"));
                            p.setIntroduction(rs.getString("introduction"));
                        }
                    }
                }
            }
            request.setAttribute("profile", p);
            request.getRequestDispatcher("updateProfile.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}