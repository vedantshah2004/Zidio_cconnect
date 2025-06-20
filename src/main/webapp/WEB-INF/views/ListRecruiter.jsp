<%@page import="com.bean.RecruiterBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Recruiter List</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CDN for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #1e3c72, #2a5298, #00c9ff);
            min-height: 100vh;
            color: white;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
        }

        .main-content {
            margin-left: 250px; /* Same width as sidebar */
            padding: 40px;
        }

        .container-glass {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
        }

        .table {
            background: rgba(255, 255, 255, 0.03);
            color: white;
        }

        .table thead {
            background: rgba(0, 0, 0, 0.3);
        }

        .table tbody tr:hover {
            background-color: rgba(255, 255, 255, 0.05);
        }

        .btn-custom {
            background: linear-gradient(to right, #ff416c, #ff4b2b);
            color: white;
            border: none;
        }

        .btn-custom:hover {
            opacity: 0.85;
        }

        h2 {
            font-weight: bold;
        }
    </style>
</head>
<body>

<!-- Sidebar Include -->
<jsp:include page="admin_sidebar.jsp" />

<!-- Main Content -->
<div class="main-content">
    <div class="container-glass">
        <h2 class="text-center mb-4">Recruiter List</h2>

        <%
            List<RecruiterBean> rec = (List<RecruiterBean>) request.getAttribute("recru");
            if (rec != null && !rec.isEmpty()) {
                Iterator<RecruiterBean> it = rec.iterator();
        %>

        <table class="table table-hover table-bordered rounded">
            <thead>
                <tr>
                    <th>First Name</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while (it.hasNext()) {
                        RecruiterBean recruBean = it.next();
                %>
                <tr>
                    <td><%= recruBean.getFirstname() %></td>
                    <td><%= recruBean.getEmail() %></td>
                    <td>
                        <a href="deleterecruiter?id=<%=recruBean.getId()%>" class="btn btn-custom btn-sm"
                           onclick="return confirm('Are you sure you want to delete this recruiter?');">
                            Delete
                        </a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <%
            } else {
        %>
            <div class="alert alert-warning text-center text-dark" role="alert">
                No recruiters found.
            </div>
        <%
            }
        %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


