<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<!-- Toastr CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet" />

<!-- jQuery (required by Toastr) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Toastr JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <title>Login - ZIDIOConnect</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
 .toast{
        background-color: red !important; /* lighter red */
        color: white !important;
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

        .signup-link {
            margin-top: 10px;
            text-align: center;
        }
    </style>
</head>

<body>
<script>
    toastr.options = {
      "closeButton": true,
      "progressBar": true,
      "positionClass": "toast-top-right",
      "timeOut": "3000"
    };
</script>


<div class="container">
    <div class="text-center mb-4">
        <h1 class="text-white fw-bold">Welcome Back to <span style="color: #ffd700;">ZIDIOConnect</span></h1>
        <p class="lead">Login to continue</p>
    </div>

    <div class="card p-4 mx-auto" style="max-width: 450px;">
        <h4 class="text-center mb-3">Login</h4>
        <form action="login" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email Address</label>
                <input type="email" name="email" class="form-control" placeholder="you@example.com" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" placeholder="••••••••" required>
            </div>

            <div class="d-grid mb-2">
                <button type="submit" class="btn btn-success">Login</button>
            </div>

			<div class="mt-2 text-end">
                       <a href="forgetpassword" class="text-decoration-none text-secondary">Forgot Password?</a>
           </div>

            <div class="signup-link">
                <small class="text-muted">Don't have an account? <a href="signup" class="text-decoration-none">Sign up here</a></small>
            </div>
            

            <span class="text-danger"> ${error}</span>
        </form>
    </div>
<c:if test="${not empty toast}">
<script>
    toastr["${toastType}"]("${toast}");
</script>
</c:if>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>