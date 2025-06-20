<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Student Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to left, #00b4db, #0043b0);
            color: white;
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
        }

        .card {
            background: rgba(0, 0, 0, 0.6);
            border: none;
            box-shadow: 0 8px 20px rgba(0,0,0,0.5);
            color: white;
        }

        .profile-label {
            font-weight: bold;
            color: #d9f2ff;
        }

        .profile-value {
            color: #fff;
        }

        .resume-btn {
            background-color: #00c6ff;
            border: none;
        }

        .resume-btn:hover {
            background-color: #009dc4;
        }
    </style>
</head>
<body>

<jsp:include page="user_sidebar.jsp" />

<div class="container" style="margin-left: 270px; padding-top: 60px;">
    <div class="card p-4">
        <h2 class="mb-4"><i class="fas fa-id-card me-2"></i>Your Profile</h2>

        <div class="row mb-3">
            <div class="col-md-4 profile-label">University:</div>
            <div class="col-md-8 profile-value">${studentProfile.university}</div>
        </div>

        <div class="row mb-3">
            <div class="col-md-4 profile-label">Degree:</div>
            <div class="col-md-8 profile-value">${studentProfile.degree}</div>
        </div>

        <div class="row mb-3">
            <div class="col-md-4 profile-label">Year of Study:</div>
            <div class="col-md-8 profile-value">${studentProfile.yearOfStudy}</div>
        </div>

        <div class="row mb-3">
            <div class="col-md-4 profile-label">Resume:</div>
            <div class="col-md-8">
                <a href="${studentProfile.resumeUrl}" target="_blank" class="btn btn-sm text-white resume-btn">
                    <i class="fas fa-link"></i> View Resume
                </a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
