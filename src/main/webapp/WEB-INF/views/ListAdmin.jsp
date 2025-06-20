<%@page import="com.bean.AdminBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bean.UserBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User List</title>
    
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="text-center mb-4">User List</h2>

    <%
        List<AdminBean> admin = (List<AdminBean>) request.getAttribute("admin");
        if (admin != null && !admin.isEmpty()) {
            Iterator<AdminBean> it = admin.iterator();
    %>

    <table class="table table-bordered table-hover table-striped">
        <thead class="table-dark">
            <tr>
                <th>First Name</th>
                <th>Email</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (it.hasNext()) {
                    AdminBean adminBean = it.next();
            %>
            <tr>
                <td><%= adminBean.getFirstname() %></td>
                <td><%= adminBean.getEmail() %></td>
                <td>
                    <a href="deleteuser?id=<%=adminBean.getId()%>" class="btn btn-danger btn-sm"
                       onclick="return confirm('Are you sure you want to delete this user?');">
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
        <div class="alert alert-warning text-center" role="alert">
            No users found.
        </div>
    <%
        }
    %>
</div>

<!-- Bootstrap JS Bundle (optional for components like modals, dropdowns) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>