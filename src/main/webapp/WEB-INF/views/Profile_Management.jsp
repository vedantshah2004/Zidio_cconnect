<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to left, #00b4db, #0043b0); /* Medium-dark gradient */
            min-height: 100vh;
            margin: 0;
            color: white;
        }

        ::placeholder {
            color: white !important; /* White placeholders */
            opacity: 0.8;
        }

        .form-control::placeholder {
            color: white !important;
        }

        .form-control {
            background: transparent;
            color: white;
            border: 1px solid white;
        }

        .form-label {
            color: white;
        }
    </style>
</head>
<body>

<jsp:include page="user_sidebar.jsp" />

<div class="container" style="margin-left: 270px; padding-top: 60px;">
    <div class="card bg-dark bg-opacity-50 text-white border-0 shadow p-4">
        <h2 class="mb-4"><i class="fas fa-user-graduate me-2"></i>Student Profile</h2>

        <form:form action="savestudentprofile" method="post" modelAttribute="studentProfileBean" class="row g-3">
            <form:hidden path="userId"/>

            <div class="col-md-6">
                <label class="form-label">University</label>
                <form:input path="university" cssClass="form-control" placeholder="Enter University"/>
            </div>

            <div class="col-md-6">
                <label class="form-label">Degree</label>
                <form:input path="degree" cssClass="form-control" placeholder="Enter Degree"/>
            </div>

            <div class="col-md-6">
                <label class="form-label">Year of Study</label>
                <form:input path="yearOfStudy" type="number" cssClass="form-control" placeholder="e.g. 3"/>
            </div>

            <div class="col-md-12">
                <label class="form-label">Resume URL</label>
                <form:input path="resumeUrl" cssClass="form-control" placeholder="Paste resume URL"/>
            </div>

            <div class="col-6">
    <button type="submit" class="btn btn-success w-100">💾 Save Profile</button>
</div>
<div class="col-6">
    <a href="updatestudentprofile" class="btn btn-warning w-100">✏️ Update Profile</a>
</div>

        </form:form>
    </div>
</div>

</body>
</html>


