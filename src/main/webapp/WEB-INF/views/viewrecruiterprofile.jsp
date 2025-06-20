<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bean.RecruiterProfileBean" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Recruiter Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            background: linear-gradient(to left 135deg, #f0f4ff, #a9e4ff);
            font-family: 'Segoe UI', sans-serif;
        }

        .main-content {
            margin-left: 260px;
            padding: 2rem;
            width: 100%;
background: linear-gradient(#4a7c8a, #5e9aa9, #7fbacb);
            min-height: 100vh;
        }

        .profile-card {
            max-width: 650px;
            margin: auto;
            background: linear-gradient(145deg, #ffffff, #f0f4ff);
            padding: 2rem 2.5rem;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            border: 1px solid #dee2e6;
        }

        .profile-card h4 {
            color: #2c3e50;
            margin-bottom: 1.5rem;
        }

        .info-label {
            font-weight: 600;
            color: #495057;
        }

        .info-value {
            color: #212529;
            font-size: 1.05rem;
        }

        .alert {
            max-width: 600px;
            margin: 2rem auto;
        }

        .card-header-icon {
            font-size: 1.5rem;
            color: #4263eb;
            margin-right: 0.5rem;
        }
    </style>
</head>
<body>

<jsp:include page="recruiter_sidebar.jsp" />

<div class="main-content">
    <h2 class="mb-4 text-center">
<i class="fas fa-user-check text-white me-2"></i> View Recruiter Profile
    </h2>

    <%
        RecruiterProfileBean profile = (RecruiterProfileBean) request.getAttribute("profile");
        String error = (String) request.getAttribute("error");

        if (error != null) {
    %>
        <div class="alert alert-warning text-center"><%= error %></div>
    <%
        } else if (profile != null) {
    %>
        <div class="profile-card">
            <div class="mb-4">
                <span class="info-label">Company Name:</span><br>
                <span class="info-value"><%= profile.getCompanyName() %></span>
            </div>
            <div class="mb-4">
                <span class="info-label">Designation:</span><br>
                <span class="info-value"><%= profile.getDesignation() %></span>
            </div>
            <div>
                <span class="info-label">Company Website:</span><br>
                <a class="info-value" href="<%= profile.getCompanyWebsite() %>" target="_blank">
                    <%= profile.getCompanyWebsite() %>
                </a>
            </div>
        </div>
    <%
        } else {
    %>
        <div class="alert alert-info text-center">No profile information available.</div>
    <%
        }
    %>
</div>

</body>
</html>

