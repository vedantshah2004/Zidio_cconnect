<%@ include file="recruiter_sidebar.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!-- jQuery (required for Toastr) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Toastr CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet" />

<!-- Toastr JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<!-- Toastr Configuration -->
<script>
  toastr.options = {
    "closeButton": true,
    "progressBar": true,
    "positionClass": "toast-top-right",
    "timeOut": "3000"
  };
</script>

<%
    String toast = (String) session.getAttribute("toast");
    if (toast != null) {
        session.removeAttribute("toast");
%>
<script>
    $(document).ready(function() {
        toastr.success('<%= toast %>');
    });
</script>
<%
    }
%>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

<style>
.toast-success {
    background-color: #28a745 !important; /* Bootstrap success green */
    color: white;
  }

  .main-content {
    margin-left: 260px;
    padding: 2rem;
    min-height: 100vh;
    background: linear-gradient(to right, #6a11cb, #2575fc);
    color: white;
  }

  .card {
    border: none;
    border-radius: 15px;
    background: rgba(255, 255, 255, 0.1);
    box-shadow: 0 10px 20px rgba(0,0,0,0.1);
    transition: transform 0.3s ease;
    color: white;
  }

  .card:hover {
    transform: translateY(-5px);
  }

  .card-body i {
    font-size: 2rem;
    color: #ffffff;
    margin-bottom: 1rem;
  }

  .section-title {
    font-weight: 700;
    margin-bottom: 2rem;
  }

  .list-group-item {
    background: rgba(255, 255, 255, 0.1);
    border: none;
    border-radius: 10px;
    color: white;
    margin-bottom: 0.5rem;
  }

  .list-group-item:hover {
    background: rgba(255, 255, 255, 0.2);
  }

  .badge {
    font-size: 0.8rem;
  }
</style>

<div class="main-content">
  <h1 class="section-title">Recruiter Dashboard</h1>

  <div class="row g-4 mb-5">
    <div class="col-md-4">
      <div class="card p-4 text-center">
        <div class="card-body">
          <i class="fas fa-briefcase"></i>
          <h5 class="card-title mt-2">Jobs Posted</h5>
          <p class="card-text">12 Listings</p>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card p-4 text-center">
        <div class="card-body">
          <i class="fas fa-users"></i>
          <h5 class="card-title mt-2">Applications</h5>
          <p class="card-text">48 Received</p>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card p-4 text-center">
        <div class="card-body">
          <i class="fas fa-user-check"></i>
          <h5 class="card-title mt-2">Shortlisted</h5>
          <p class="card-text">8 Candidates</p>
        </div>
      </div>
    </div>
  </div>

  <h4 class="section-title">Latest Opportunities</h4>
  <ul class="list-group">
    <li class="list-group-item d-flex justify-content-between align-items-center">
      Frontend Developer Internship <span class="badge bg-success rounded-pill">Remote</span>
    </li>
    <li class="list-group-item d-flex justify-content-between align-items-center">
      Java Backend Role <span class="badge bg-primary rounded-pill">Onsite</span>
    </li>
    <li class="list-group-item d-flex justify-content-between align-items-center">
      UI/UX Designer <span class="badge bg-info rounded-pill">Hybrid</span>
    </li>
  </ul>
</div>

