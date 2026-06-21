<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.profile.model.ProfileBean" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css" type="text/css"/>

    <style>
        body {
            background-image: url('exo 3.jpg') !important; 
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-repeat: no-repeat;
        }
        .title-blue {
            color: #0077b6 !important;
        }
        /* Butang Carian yang Jelas */
        .btn-search-blue {
            background-color: #00a8ec !important;
            color: white !important;
            font-weight: bold !important;
            border: none;
        }
        .btn-search-blue:hover {
            background-color: #0077b6 !important;
            color: white !important;
        }
        .link-blue {
            color: #00a8ec !important;
            text-decoration: none;
        }
        .search-box-card {
            background-color: #ffffff !important;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08) !important;
        }
        .search-result-card {
            background-color: rgba(255, 255, 255, 0.95) !important;
            border: 1px solid #e2eef5 !important;
        }
        .id-badge {
            background-color: #e0f2fe; 
            color: #0369a1; 
            font-weight: 600;
        }
    </style>
</head>
<body class="py-5">
    <div class="container" style="max-width: 600px;">
        
        <div class="card p-4 border-0 rounded-4 search-box-card mb-4">
            <h4 class="fw-bold mb-3 text-center title-blue">🔍 Search Student Profile</h4>
            <form action="SearchProfileServlet" method="GET">
                <div class="input-group mb-3">
                    <input type="text" name="query" class="form-control" placeholder="Enter Student ID or Name..." required>
                    <button class="btn btn-search-blue px-4" type="submit">Search</button>
                </div>
            </form>
            <div class="text-center"><a href="index.html" class="link-blue small fw-bold">🏠 Back to Home</a></div>
        </div>

        <% List<ProfileBean> results = (List<ProfileBean>) request.getAttribute("searchResults");
           if (results != null) {
               if(!results.isEmpty()) {
                   for(ProfileBean p : results) { %>
                    <div class="card p-4 border-0 rounded-4 mb-3 search-result-card shadow-sm">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <h4 class="fw-bold mb-0" style="color: #2b2b2b;"><%= p.getName() %></h4>
                            <span class="badge id-badge rounded-pill px-3 py-2">
                                🆔 Student ID: <%= p.getStudentID() %>
                            </span>
                        </div>
                        <hr style="border-top: 1px dashed #b0e0e6;" class="my-2">
                        <div class="mt-2 small">
                            <p class="mb-1"><strong>Programme:</strong> <span style="color: #008b8b;"><%= p.getProgramme() %></span></p>
                            <p class="mb-1"><strong>Email:</strong> <%= p.getEmail() %></p>
                            <p class="mb-2"><strong>Hobbies:</strong> <span class="text-muted"><%= p.getHobbies() %></span></p>
                            <p class="mb-0 mt-3 text-center text-muted"><i>"<%= p.getIntroduction() %>"</i></p>
                        </div>
                    </div>
               <% } } else { %>
                    <div class="alert alert-warning text-center rounded-3 fw-bold">
                        ⚠️ No matching profiles found.
                    </div>
        <% } } %>
    </div>
</body>
</html>