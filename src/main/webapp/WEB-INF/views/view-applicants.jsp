<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.bean.UserBean" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Applicants</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="margin: 0; padding: 40px; font-family: 'Segoe UI', sans-serif; background: #f2f8fc;">
    <div class="container">
        <h3 class="text-center mb-4">🧑‍💼 Applicants for this Job/Internship</h3>
        <%
            List<UserBean> applicants = (List<UserBean>) request.getAttribute("applicants");
            if (applicants != null && !applicants.isEmpty()) {
        %>
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>#</th>
                    <th>Full Name</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int i = 1;
                    for (UserBean user : applicants) {
                %>
                <tr>
                    <td><%= i++ %></td>
                    <td><%= user.getFirstname() + " " + user.getLastname() %></td>
                    <td><%= user.getEmail() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            } else {
        %>
            <div class="alert alert-info text-center">No applicants yet.</div>
        <%
            }
        %>
    </div>
</body>
</html>
