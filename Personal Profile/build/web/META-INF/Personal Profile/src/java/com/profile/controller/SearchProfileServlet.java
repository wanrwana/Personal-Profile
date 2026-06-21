package com.profile.controller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.profile.model.ProfileBean;

@WebServlet("/SearchProfileServlet")
public class SearchProfileServlet extends HttpServlet {
    private final String DB_URL = "jdbc:derby://localhost:1527/StudentProfilesDB";
    private final String DB_USER = "app";
    private final String DB_PASS = "app";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String query = request.getParameter("query");
        List<ProfileBean> list = new ArrayList<>();

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
String sql = "SELECT * FROM PROFILE WHERE STUDENTID LIKE ? OR LOWER(NAME) LIKE LOWER(?)";
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, "%" + query + "%");
                    ps.setString(2, "%" + query + "%");
                    try (ResultSet rs = ps.executeQuery()) {
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
            }
            request.setAttribute("searchResults", list);
            request.getRequestDispatcher("search.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}