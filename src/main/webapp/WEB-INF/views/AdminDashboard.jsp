<%@page import="com.bean.RecruiterBean"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - ZIDIOConnect</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Toastr CSS & JS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <!-- Toastr Config -->
    <script>
        toastr.options = {
            "closeButton": true,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "timeOut": "3000"
        };
    </script>

    <!-- Custom Green Toast Styling -->
    <style>
        .toast-success {
            background-color: #28a745 !important;
            color: white;
        }
    </style>

    <!-- Page Styling -->
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #2b5876, #4e4376);
            min-height: 100vh;
            display: flex;
        }

        .content {
            margin-left: 250px;
            padding: 40px;
            width: 100%;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            padding: 40px;
            color: #fff;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            animation: fadeIn 0.5s ease-in-out;
        }

        .glass-card h2 {
            font-weight: 600;
            font-size: 32px;
        }

        .stats-box {
            display: flex;
            gap: 30px;
            margin-top: 30px;
            flex-wrap: wrap;
        }

        .stats-item {
            flex: 1;
            min-width: 200px;
            padding: 25px;
            background: rgba(255, 255, 255, 0.15);
            border-radius: 15px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .stats-item:hover {
            transform: scale(1.05);
            background: rgba(255, 255, 255, 0.25);
        }

        .stats-item h4 {
            font-size: 24px;
            color: #fff;
        }

        .stats-item span {
            font-size: 18px;
            color: #ddd;
            display: block;
            margin-top: 8px;
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
    <div class="glass-card">
        <h2>Welcome Admin</h2>
        <p class="text-white-50">Monitor your user base and platform stats here.</p>

        <div class="stats-box">
            <div class="stats-item">
                <%
                    List<UserBean> users = (List<UserBean>) request.getAttribute("user");
                    int totalUsers = users != null ? users.size() : 0;
                %>
                <h4><%= totalUsers %></h4>
                <span>Total Users</span>
            </div>

            <div class="stats-item">
                <%
                    List<RecruiterBean> recruiters = (List<RecruiterBean>) request.getAttribute("recru");
                    int totalRecruiters = recruiters != null ? recruiters.size() : 0;
                %>
                <h4><%= totalRecruiters %></h4>
                <span>Total Recruiters</span>
            </div>

            <div class="stats-item">
                <h4>8</h4>
                <span>New Signups Today</span>
            </div>
        </div>
    </div>
</div>

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
