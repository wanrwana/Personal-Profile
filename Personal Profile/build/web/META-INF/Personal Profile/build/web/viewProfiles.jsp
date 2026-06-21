<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.profile.model.ProfileBean" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Profiles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f9fc;
            background-image: url('exo 3.jpg'); 
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-repeat: no-repeat;
        }
        
        .title-blue {
            color: #0077b6;
        }
        .custom-card {
            background-color: rgba(255, 255, 255, 0.9);
        }
    </style>
</head>

<body class="bg-light py-5">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="fw-bold">💎 Student Profiles Details</h3>
            <div class="d-flex gap-2">
        <a href="index.html" class="btn btn-primary rounded-pill">Add Profile</a>
        <a href="index.html" class="btn btn-primary rounded-pill">🏠 Back to Home</a>
            </div>
</div>
        <div class="row g-3">
            <% List<ProfileBean> list = (List<ProfileBean>) request.getAttribute("profileList");
               if (list != null && !list.isEmpty()) {
                   for (ProfileBean p : list) { %>
                    <div class="col-md-4">
                        <div class="card h-100 shadow-sm border-0 rounded-3">
                            <div class="bg-dark p-3 text-white rounded-top">
                                <div class="bg-dark p-3 text-white rounded-top">
                                   <h5 class="mb-1 text-truncate"><%= p.getName() %></h5>
                                   <span class="badge" style="background-color: rgba(255, 255, 255, 0.15); color: #ffffff; font-weight: 500; font-size: 0.75rem; letter-spacing: 0.5px;">
                                   <i class="bi bi-card-id me-1"></i>Student ID: <%= p.getStudentID() %>
    </span>
</div>
                            </div>
                            <div class="card-body small">
                                <p class="mb-1"><strong>Programme:</strong> <%= p.getProgramme() %></p>
                                <p class="mb-1"><strong>Email:</strong> <%= p.getEmail() %></p>
                                <p class="mb-1"><strong>Hobbies:</strong> <%= p.getHobbies() %></p>
                                <p class="text-muted mb-0"><i>"<%= p.getIntroduction() %>"</i></p>
                            </div>
                            <div class="card-footer bg-white border-0 d-flex justify-content-between pb-3">
            
                                <a href="EditProfileServlet?studentID=<%= p.getStudentID() %>" class="btn btn-warning btn-sm text-white rounded-pill px-3">Edit</a>
                                <a href="DeleteProfileServlet?studentID=<%= p.getStudentID() %>" class="btn btn-danger btn-sm rounded-pill px-3" onclick="return confirm('Delete profile?');">Delete</a>
                            </div>
                        </div>
                    </div>
               <% } } else { %>
                    <div class="col-12"><div class="alert alert-info text-center">No profiles found.</div></div>
               <% } %>
        </div>
    </div>
</body>
</html>