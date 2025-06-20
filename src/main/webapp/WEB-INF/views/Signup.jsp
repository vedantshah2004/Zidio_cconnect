<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Signup - ZIDIOConnect</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .lead {
            color: white;
            font-weight: 500;
        }

        .login-link {
            margin-top: 10px;
            text-align: center;
        }

        .forgot-password {
            text-align: right;
            margin-top: -10px;
            margin-bottom: 10px;
        }
    </style>

    <script>
        function updateFormActionAndSubmit() {
            const form = document.getElementById("signupForm");
            const role = document.getElementById("roleInput").value;

            if (role === "admin") {
                form.action = "saveadmin";
            } else if (role === "recruiter") {
                form.action = "saverecruiter";
            } else if (role === "user") {
                form.action = "saveuser";
            } else {
                alert("Please select a valid role.");
                return false;
            }

            form.submit();
        }
    </script>
</head>
<body>

<div class="container">
    <div class="text-center mb-4">
        <h1 class="text-white fw-bold">Join <span style="color: #ffd700;">ZIDIOConnect</span></h1>
        <p class="lead">Create your account by filling out the form below</p>
    </div>

    <!-- Role Selection Above Form -->
    <div class="card p-4 mx-auto mb-3" style="max-width: 500px;">
        <div class="mb-3">
            <label for="roleInput" class="form-label">Select Role</label>
            <select name="role" id="roleInput" class="form-select" required>
                <option value="" selected disabled>-- Choose your role --</option>
                <option value="admin">👨‍💼 Admin</option>
                <option value="user">🎓 Student</option>
                <option value="recruiter">🧑‍💻 Recruiter</option>
            </select>
        </div>
    </div>

    <!-- Signup Form Card -->
    <div class="card p-4 mx-auto" style="max-width: 500px;">
        <h4 class="text-center mb-3">Signup</h4>
        <form id="signupForm" method="post">

            <div class="row mb-3">
                <div class="col">
                    <label for="firstName" class="form-label">First Name</label>
                    <input type="text" name="firstname" class="form-control" placeholder="John" required>
                </div>
                <div class="col">
                    <label for="lastName" class="form-label">Last Name</label>
                    <input type="text" name="lastname" class="form-control" placeholder="Doe" required>
                </div>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email Address</label>
                <input type="email" name="email" class="form-control" placeholder="example@email.com" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Create Password</label>
                <input type="password" name="password" class="form-control" placeholder="••••••••" required>
            </div>

            <div class="forgot-password">
                <a href="forgotpassword" class="text-light text-decoration-none small">Forgot Password?</a>
            </div>

            <div class="d-grid mb-2">
                <button type="button" onclick="updateFormActionAndSubmit()" class="btn btn-primary">Create Account</button>
            </div>

            <div class="login-link">
                <small class="text-muted">Already registered? <a href="login" class="text-decoration-none">Go to Login</a></small>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


