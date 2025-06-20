<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-lg rounded-4">
                <div class="card-header text-center bg-warning text-dark">
                    <h4>Forgot Password</h4>
                </div>
                <div class="card-body">
                    <form action="sendotp" method="post">
                        <div class="mb-3">
                            <label for="email" class="form-label">Enter your registered email address</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <button type="submit" class="btn btn-warning w-100">Send OTP</button>
                    </form>
                    <div class="mt-3 text-center">
                        <a href="login" class="text-decoration-none">Back to Login</a>
                    </div>
                    <div class="mt-2 text-center text-success">${message}</div>
                    <div class="mt-1 text-center text-danger">${error}</div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>