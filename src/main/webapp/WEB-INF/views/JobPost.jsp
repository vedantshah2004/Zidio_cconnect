<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="recruiter_sidebar.jsp" %> <!-- Including the sidebar -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Post Job/Internship</title>

    <!-- Bootstrap & Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #e0eafc, #cfdef3);
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
        }

        .main-content {
            margin-left: 260px; /* Width of sidebar */
            padding: 40px 20px;
        }

        .form-container {
            max-width: 700px;
            margin: auto;
            background: linear-gradient(135deg, #ffffff, #f2f5f9);
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            animation: fadeIn 0.6s ease-in-out;
        }

        h4 {
            font-weight: 600;
            color: #333;
        }

        .form-label {
            font-weight: 500;
            color: #444;
        }

        .btn-primary {
            background: linear-gradient(135deg, #5a11cb, #3175fc);
            border: none;
            font-weight: 500;
            letter-spacing: 0.5px;
            transition: all 0.3s ease-in-out;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #4a0fb4, #2762d6);
            transform: scale(1.03);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="main-content">
    <div class="form-container">
        <h4 class="text-center mb-4"><i class="fas fa-briefcase me-2"></i>Post Job / Internship</h4>

        <form action="postjob" method="post">
            <div class="mb-3">
                <label class="form-label">Title</label>
                <input type="text" name="title" class="form-control" placeholder="Enter job/internship title" required />
            </div>
            <div class="mb-3">
                <label class="form-label">Description</label>
                <textarea name="description" class="form-control" rows="4" placeholder="Enter job/internship description" required></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Location</label>
                <input type="text" name="location" class="form-control" placeholder="e.g. Remote, Mumbai, etc." required />
            </div>
            <div class="mb-3">
                <label class="form-label">Type</label>
                <select name="jobType" class="form-control" required>
                    <option value="" disabled selected>Select type</option>
                    <option value="job">Job</option>
                    <option value="internship">Internship</option>
                </select>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary btn-lg">Post Opportunity</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>

