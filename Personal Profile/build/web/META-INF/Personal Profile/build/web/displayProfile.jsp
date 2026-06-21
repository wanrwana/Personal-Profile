<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.profile.model.ProfileBean" %>
<!DOCTYPE html>
<html>
<head>
    <title>Profile Saved</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css" type="text/css"/>
    
    <style>
        /* Paksa guna gambar exo 3.jpg kau kalau style.css tak load */
        body {
            background-image: url('exo 3.jpg') !important; 
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-repeat: no-repeat;
        }
        /* Kotak kad lutsinar cerah */
        .custom-card-success {
            background-color: rgba(255, 255, 255, 0.93) !important;
            box-shadow: 0 8px 32px rgba(180, 200, 220, 0.3) !important;
        }
        /* Badge ID */
        .id-badge-success {
            background-color: #e0f2fe; 
            color: #0369a1; 
            font-size: 0.9rem; 
            font-weight: 600;
            display: inline-block;
        }
        /* Butang Back Home Biru Cerah */
        .btn-blue-home {
            background-color: #00a8ec !important;
            border-color: #00a8ec !important;
            color: white !important;
        }
        .btn-blue-home:hover {
            background-color: #0077b6 !important;
        }
    </style>
</head>
<body class="py-5">
    <div class="container text-center" style="max-width: 500px;">
        <div class="card border-0 rounded-4 p-4 custom-card-success">
            <div class="alert alert-success fw-bold rounded-3">
                <i class="bi bi-check-circle-fill me-2"></i>Saved Successfully!
            </div>
            
            <% ProfileBean p = (ProfileBean) request.getAttribute("newProfile");
               if(p != null) { %>
                <h3 class="fw-bold mb-1" style="color: #2b2b2b;"><%= p.getName() %></h3>
                
                <div class="my-2">
                    <span class="badge id-badge-success rounded-pill px-3 py-2">
                        🆔 Student ID: <%= p.getStudentID() %>
                    </span>
                </div>
                
                <hr style="border-top: 1px dashed #b0e0e6;">
                
                <div class="px-2 small">
                    <p class="text-start mb-2"><strong>Programme:</strong> <span style="color: #008b8b;"><%= p.getProgramme() %></span></p>
                    <p class="text-start mb-2"><strong>Email:</strong> <%= p.getEmail() %></p>
                    <p class="text-start mb-2"><strong>Hobbies:</strong> <%= p.getHobbies() %></p>
                    <p class="text-center text-muted mt-3 mb-1"><i>"<%= p.getIntroduction() %>"</i></p>
                </div>
            <% } %>
            
            <a href="index.html" class="btn btn-blue-home rounded-pill mt-3 w-100 fw-bold shadow-sm">🏠 Back to Home</a>
        </div>
    </div>
</body>
</html>