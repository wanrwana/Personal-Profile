package com.profile.controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.profile.model.ProfileBean;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private final String DB_URL = "jdbc:derby://localhost:1527/StudentProfilesDB";
    private final String DB_USER = "app";
    private final String DB_PASS = "app";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        ProfileBean p = new ProfileBean();
        p.setStudentID(request.getParameter("studentID"));
        p.setName(request.getParameter("name"));
        p.setProgramme(request.getParameter("programme"));
        p.setEmail(request.getParameter("email"));
        p.setHobbies(request.getParameter("hobbies"));
        p.setIntroduction(request.getParameter("introduction"));

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
                // Tukar bahagian ini di dalam ProfileServlet.java kau
String sql = "INSERT INTO STUDENTPROFILESDB (STUDENTID, NAME, PROGRAMME, EMAIL, HOBBIES, INTRODUCTION) VALUES (?, ?, ?, ?, ?, ?)";
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, p.getStudentID());
                    ps.setString(2, p.getName());
                    ps.setString(3, p.getProgramme());
                    ps.setString(4, p.getEmail());
                    ps.setString(5, p.getHobbies());
                    ps.setString(6, p.getIntroduction());
                    ps.executeUpdate();
                }
            }
            request.setAttribute("newProfile", p);
            request.getRequestDispatcher("displayProfile.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}