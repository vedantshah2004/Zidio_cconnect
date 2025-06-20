<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Recruiter Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            min-height: 100vh;
            color: white;
        }

        ::placeholder {
            color: white;
            opacity: 0.7;
        }

        .form-control {
            background: transparent;
            border: 1px solid white;
            color: white;
        }

        .form-label {
            color: white;
        }
    </style>
</head>
<body>

<jsp:include page="recruiter_sidebar.jsp" />

<div class="container" style="margin-left: 270px; padding-top: 60px;">
    <div class="card bg-dark bg-opacity-50 border-0 shadow p-4 text-white">
        <h2 class="mb-4"><i class="fas fa-user-tie me-2"></i>Recruiter Profile</h2>

       <form:form action="saverecruiterprofile" method="post" modelAttribute="recruiterProfileBean" class="row g-3">
    <form:hidden path="recruiterId" /> <!-- ✅ Corrected line -->

            <div class="col-md-6">
                <label class="form-label">Company Name</label>
                <form:input path="companyName" cssClass="form-control" placeholder="Enter Company Name"/>
            </div>

            <div class="col-md-6">
                <label class="form-label">Designation</label>
                <form:input path="designation" cssClass="form-control" placeholder="Enter Your Designation"/>
            </div>

            <div class="col-md-12">
                <label class="form-label">Company Website</label>
                <form:input path="companyWebsite" cssClass="form-control" placeholder="https://yourcompany.com"/>
            </div>

            <div class="col-6">
                <button type="submit" class="btn btn-primary w-100">💾 Save Profile</button>
            </div>
            
            <div class="col-6">
    <button type="submit" class="btn btn-warning w-100">✏️ Update Profile</button>
</div>
            
        </form:form>
    </div>
</div>

</body>
</html>
    