<%@page import="java.util.Iterator"%>
<%@page import="com.bean.UserBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User List</title>

    <!-- Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #1e3c72, #2a5298, #00c9ff);
            display: flex;
            min-height: 100vh;
        }

        .content {
            margin-left: 250px;
            padding: 40px;
            width: 100%;
        }

        .glass-box {
            background: rgba(255, 255, 255, 0.15);
            border-radius: 15px;
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            padding: 30px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.5s ease-in-out;
            color: white;
        }

        .glass-box h2 {
            font-weight: 700;
            margin-bottom: 25px;
        }

        .table {
            backdrop-filter: blur(8px);
            background-color: rgba(255, 255, 255, 0.08);
            color: #fff;
            border-radius: 10px;
            overflow: hidden;
        }

        .table thead {
            background: linear-gradient(to right, #8e2de2, #4a00e0);
            color: #fff;
        }

        .table tbody tr {
            transition: background 0.3s ease;
        }

        .table tbody tr:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .btn-custom {
            background: linear-gradient(to right, #ff416c, #ff4b2b);
            color: white;
            border: none;
            transition: 0.3s;
        }

        .btn-custom:hover {
            background: linear-gradient(to right, #ff4b2b, #ff416c);
            color: white;
        }

        .alert-warning {
            background-color: rgba(255, 255, 255, 0.2);
            color: white;
            border: none;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<%@ include file="admin_sidebar.jsp" %>

<div class="content">
    <div class="glass-box">
        <h2>User List</h2>

        <%
            List<UserBean> user = (List<UserBean>) request.getAttribute("user");
            if (user != null && !user.isEmpty()) {
                Iterator<UserBean> it = user.iterator();
        %>

        <table class="table table-hover table-bordered">
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
                        UserBean userBean = it.next();
                %>
                <tr>
                    <td><%= userBean.getFirstname() %></td>
                    <td><%= userBean.getEmail() %></td>
                    <td>
                        <a href="deleteuser?id=<%=userBean.getId()%>"
                           class="btn btn-sm btn-custom"
                           onclick="return confirm('Are you sure you want to delete this user?');">
                            <i class="fas fa-trash"></i> Delete
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
            <div class="alert alert-warning text-center" role="alert">
                No users found.
            </div>
        <%
            }
        %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

