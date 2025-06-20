<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Toastr -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <script>
        toastr.options = {
            "closeButton": true,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "timeOut": "3000"
        };
    </script>

    <style>
        body {
            background: linear-gradient(to left, #43cea2, #185a9d);
            font-family: 'Segoe UI', sans-serif;
        }

        .dashboard-header {
            background: linear-gradient(to right, #43cea2, #185a9d);
            color: white;
            padding: 35px;
            border-radius: 20px;
            margin-bottom: 30px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        .card-custom {
            background: white;
            border-radius: 20px;
            transition: all 0.3s ease-in-out;
            border: none;
        }

        .card-custom:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 32px rgba(0,0,0,0.1);
        }

        .icon-box {
            font-size: 48px;
            color: #185a9d;
            margin-right: 20px;
        }

        .btn-outline-primary {
            border-radius: 20px;
        }

        /* Green Toast */
        .toast-success {
            background-color: #28a745 !important;
            color: white;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">

        <!-- Sidebar -->
        <%@ include file="user_sidebar.jsp" %>

        <!-- Dashboard Content -->
        <div class="col-md-9 offset-md-3 p-4">
            <div class="dashboard-header">
                <h2 class="fw-bold">Welcome, <%= session.getAttribute("userName") != null ? session.getAttribute("userName") : "Student" %> 🎓</h2>
                <p class="mb-0">Manage your career journey from here!</p>
            </div>

            <div class="row g-4">
                <!-- Profile Management -->
                <div class="col-md-6">
                    <div class="card card-custom shadow-sm d-flex flex-row align-items-center p-3">
                        <div class="icon-box"><i class="bi bi-person-circle"></i></div>
                        <div>
                            <h5 class="card-title">Profile Management</h5>
                            <p class="text-muted">Update your personal and academic details.</p>
                            <a href="/user/profile" class="btn btn-outline-primary btn-sm">Manage Profile</a>
                        </div>
                    </div>
                </div>

                <!-- Upload Resume -->
                <div class="col-md-6">
                    <div class="card card-custom shadow-sm d-flex flex-row align-items-center p-3">
                        <div class="icon-box"><i class="bi bi-file-earmark-arrow-up-fill"></i></div>
                        <div>
                            <h5 class="card-title">Upload Resume</h5>
                            <p class="text-muted">Keep your resume up-to-date for recruiters.</p>
                            <a href="/user/resume" class="btn btn-outline-primary btn-sm">Upload Resume</a>
                        </div>
                    </div>
                </div>

                <!-- Opportunities -->
                <div class="col-md-6">
                    <div class="card card-custom shadow-sm d-flex flex-row align-items-center p-3">
                        <div class="icon-box"><i class="bi bi-rocket-takeoff-fill"></i></div>
                        <div>
                            <h5 class="card-title">Opportunities</h5>
                            <p class="text-muted">Discover internships and job roles that fit you.</p>
                            <a href="viewjobs" class="btn btn-outline-primary btn-sm">Explore</a>
                        </div>
                    </div>
                </div>

                <!-- Application Status -->
                <div class="col-md-6">
                    <div class="card card-custom shadow-sm d-flex flex-row align-items-center p-3">
                        <div class="icon-box"><i class="bi bi-bar-chart-steps"></i></div>
                        <div>
                            <h5 class="card-title">View Profile</h5>
                            <a href="viewstudentprofile" class="btn btn-outline-primary btn-sm">View Profile</a>
                        </div>
                    </div>
                </div>
            </div> <!-- row end -->
        </div> <!-- col-9 -->
    </div> <!-- row -->
</div> <!-- container -->

<%
    String toast = (String) session.getAttribute("toast");
    if (toast != null) {
        session.removeAttribute("toast");
%>
<script>
    $(document).ready(function () {
        toastr.success('<%= toast %>');
    });
</script>
<%
    }
%>

</body>
</html>

