<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.profile.model.ProfileBean" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('exo 1.jpg'); 
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body class="bg-light py-5">
    <div class="container" style="max-width: 500px;">
        <div class="card shadow p-4 border-0 rounded-4">
            <h4 class="fw-bold mb-3 text-center">Update Profile</h4>
            <% ProfileBean p = (ProfileBean) request.getAttribute("profile"); 
               if(p != null) { %>
                <form action="UpdateProfileServlet" method="POST">
                    <div class="mb-2">
                        <label class="small fw-bold">Student ID (Read-only)</label>
                        <input type="text" name="studentID" class="form-control bg-light" value="<%= p.getStudentID() %>" readonly>
                    </div>
                    <div class="mb-2">
                        <label class="small fw-bold">Name</label>
                        <input type="text" name="name" class="form-control" value="<%= p.getName() %>" required>
                    </div>
                    <div class="mb-2">
                        <label class="small fw-bold">Programme</label>
                        <input type="text" name="programme" class="form-control" value="<%= p.getProgramme() %>" required>
                    </div>
                    <div class="mb-2">
                        <label class="small fw-bold">Email</label>
                        <input type="email" name="email" class="form-control" value="<%= p.getEmail() %>" required>
                    </div>
                    <div class="mb-2">
                        <label class="small fw-bold">Hobbies</label>
                        <input type="text" name="hobbies" class="form-control" value="<%= p.getHobbies() %>" required>
                    </div>
                    <div class="mb-3">
                        <label class="small fw-bold">Short Self Introduction</label>
                        <textarea name="introduction" class="form-control" rows="3" required><%= p.getIntroduction() %></textarea>
                    </div>
                    <button type="submit" class="btn btn-warning text-white w-100 rounded-pill fw-bold">Save Changes</button>
                </form>
            <% } %>
        </div>
    </div>
</body>
</html>