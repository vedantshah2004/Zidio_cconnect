<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome Recruiter - ZIDIOConnect</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #1c92d2, #f2fcfe);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .welcome-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 600px;
            animation: fadeIn 0.7s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .highlight {
            color: #007bff;
            font-weight: 600;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            font-weight: 600;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .logo {
            width: 80px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="welcome-card">
    <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Recruiter Icon" class="logo">
    <h2>Welcome, <span class="highlight">Recruiter!</span></h2>
    <p class="lead mt-3">You’re now part of <strong>ZIDIOConnect</strong> – the smart way to find talented students and build your hiring pipeline.</p>

    <p>From posting job opportunities to connecting with verified candidates, everything you need is right here.</p>

    <a href="recruiterdashboard.jsp" class="btn btn-primary mt-4 px-4 py-2">Go to Dashboard</a>

    <hr class="my-4">
    <p style="font-size: 0.9rem;" class="text-muted">Need help? <a href="contact.jsp" class="text-decoration-none">Contact Support</a></p>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
