<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome Admin - ZIDIOConnect</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #232526, #414345);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .welcome-card {
            background: rgba(255, 255, 255, 0.97);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 12px 28px rgba(0, 0, 0, 0.3);
            text-align: center;
            max-width: 650px;
            animation: fadeIn 0.7s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .highlight {
            color: #ff9800;
            font-weight: 600;
        }

        .btn-warning {
            background-color: #ff9800;
            border: none;
            font-weight: 600;
        }

        .btn-warning:hover {
            background-color: #e68900;
        }

        .logo {
            width: 90px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="welcome-card">
    <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Admin Icon" class="logo">
    <h2>Welcome, <span class="highlight">Admin!</span></h2>
    <p class="lead mt-3">You've successfully joined <strong>ZIDIOConnect</strong>, the platform that empowers educational and recruitment collaboration.</p>

    <p>As an Admin, you're now equipped to manage users, monitor activities, and oversee the platform's operations efficiently.</p>

    <a href="admindashboard.jsp" class="btn btn-warning mt-4 px-4 py-2">Go to Admin Dashboard</a>

    <hr class="my-4">
    <p class="text-muted" style="font-size: 0.9rem;">Need assistance? <a href="support.jsp" class="text-decoration-none">Contact Support</a></p>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
