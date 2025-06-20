<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to ZIDIOConnect</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #4e54c8, #8f94fb);
            color: #fff;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .card {
            background: rgba(255, 255, 255, 0.1);
            border: none;
            border-radius: 20px;
            backdrop-filter: blur(10px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.3);
            padding: 40px 30px;
            max-width: 600px;
            animation: fadeIn 0.8s ease-in-out;
        }

        h1 {
            font-weight: 700;
        }

        .highlight {
            color: #ffd700;
        }

        .btn-primary {
            background-color: #ffd700;
            color: #000;
            font-weight: 600;
            border: none;
        }

        .btn-primary:hover {
            background-color: #e6c200;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .logo {
            width: 80px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="card">
    <img src="https://cdn-icons-png.flaticon.com/512/3125/3125713.png" alt="ZIDIOConnect Logo" class="logo">
    <h1>Welcome to <span class="highlight">ZIDIOConnect</span>!</h1>
    <p class="lead mt-3">Hello <strong>${firstname}</strong>,</p>
    <p>Thank you for signing up with <strong>ZIDIOConnect</strong> – a powerful platform to connect <span class="highlight">Students</span>, <span class="highlight">Recruiters</span>, and <span class="highlight">Admins</span> together for better opportunities and collaboration.</p>

    <p>We're excited to have you on board. Explore internships, connect with companies, or manage your academic goals efficiently!</p>

    <a href="login" class="btn btn-primary mt-4 px-4 py-2">Go to Dashboard</a>

    <hr class="my-4" style="border-color: rgba(255,255,255,0.3);">

    <p style="font-size: 0.9rem;">If you didn't sign up for this account, you can ignore this email.</p>
    <p style="font-size: 0.85rem;">&copy; 2025 ZIDIOConnect. All rights reserved.</p>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
