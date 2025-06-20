<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.bean.JobBean" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Job/Internship Listings</title>

    <!-- Bootstrap & Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to left, #00b4db, #0053b0);
        }

        .container-jobs {
            margin-left: 270px;
            padding: 40px 30px;
            max-width: 1100px;
        }

        .card-job {
            background: linear-gradient(to right, #ffffff, #f2f9ff);
            border-left: 5px solid #0083b0;
            border-radius: 15px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.08);
            padding: 25px;
            margin-bottom: 25px;
            transition: all 0.3s ease-in-out;
        }

        .card-job:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        }

        .card-job h5 {
            font-weight: 600;
            color: #004d7a;
        }

        .card-job p {
            color: #444;
            margin-bottom: 8px;
        }

        .badge {
            font-size: 0.85rem;
            padding: 6px 14px;
            border-radius: 20px;
        }

        .badge-job {
            background-color: #5a11cb;
        }

        .badge-internship {
            background-color: #2575fc;
        }

        .btn-apply {
            transition: 0.3s ease-in-out;
        }

        .btn-apply:hover {
            background-color: #0083b0;
            color: white;
        }

        .no-jobs {
            background: #fff;
            border-radius: 10px;
            padding: 40px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<jsp:include page="user_sidebar.jsp" />

<div class="container-jobs">
    <h3 class="text-center mb-4"><i class="fas fa-clipboard-list me-2"></i>Available Job & Internship Posts</h3>

    <%
        List<JobBean> jobs = (List<JobBean>) request.getAttribute("jobs");
        if (jobs != null && !jobs.isEmpty()) {
            for (JobBean job : jobs) {
    %>
        <div class="card-job">
            <h5><%= job.getTitle() %></h5>
            <%
                if ("internship".equalsIgnoreCase(job.getJobType())) {
            %>
                <span class="badge badge-internship text-white">Internship</span>
            <%
                } else {
            %>
                <span class="badge badge-job text-white">Job</span>
            <%
                }
            %>
            <p><strong>Location:</strong> <%= job.getLocation() %></p>
            <p><strong>Description:</strong> <%= job.getDescription() %></p>
            <div class="text-end">
                <a href="apply?jobId=<%= job.getId()%>" class="btn btn-outline-primary btn-sm btn-apply">Apply</a>
            </div>
        </div>
    <%
            }
        } else {
    %>
        <div class="no-jobs mt-4">
            <h5>No job/internship posts available at the moment.</h5>
        </div>
    <%
        }
    %>
</div>

</body>
</html>
