package com.profile.controller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.profile.model.ProfileBean;

@WebServlet("/ViewProfileServlet")
public class ViewProfileServlet extends HttpServlet {
    private final String DB_URL = "jdbc:derby://localhost:1527/StudentProfilesDB";
    private final String DB_USER = "app";
    private final String DB_PASS = "app";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<ProfileBean> list = new ArrayList<>();
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
                String sql = "SELECT * FROM PROFILE";
                try (PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        ProfileBean p = new ProfileBean();
                        p.setStudentID(rs.getString("studentID"));
                        p.setName(rs.getString("name"));
                        p.setProgramme(rs.getString("programme"));
                        p.setEmail(rs.getString("email"));
                        p.setHobbies(rs.getString("hobbies"));
                        p.setIntroduction(rs.getString("introduction"));
                        list.add(p);
                    }
                }
            }
            request.setAttribute("profileList", list);
            request.getRequestDispatcher("viewProfiles.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}