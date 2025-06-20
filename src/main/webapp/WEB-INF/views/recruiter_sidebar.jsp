<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

<style>
  .sidebar {
    width: 260px;
    height: 100vh;
    position: fixed;
    top: 0;
    left: 0;
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    color: white;
    padding: 2rem 1rem;
    display: flex;
    flex-direction: column;
    align-items: center;
    box-shadow: 2px 0 10px rgba(0,0,0,0.2);
    text-align: center;
  }

  .sidebar img.logo {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    object-fit: cover;
    border: 3px solid #fff;
    margin-bottom: 1rem;
  }

  .sidebar h2 {
    font-size: 1.5rem;
    font-weight: bold;
    margin-bottom: 2rem;
  }

  .sidebar .nav-link {
    color: #ffffffd9;
    margin: 0.5rem 0;
    padding: 0.7rem 1rem;
    border-radius: 8px;
    transition: all 0.3s;
    font-size: 1rem;
    text-align: left;
    width: 100%;
  }

  .sidebar .nav-link:hover,
  .sidebar .nav-link.active {
    background-color: rgba(255, 255, 255, 0.2);
    color: #fff;
  }

  .logout-btn {
    margin-top: auto;
    width: 100%;
  }
</style>

<div class="sidebar">
  <!-- Logo or Recruiter Photo -->
<img class="logo" src="https://cdn-icons-png.flaticon.com/512/219/219983.png" alt="Recruiter Logo">

  <!-- Heading -->
  <h2><i class="fas fa-briefcase me-2"></i>Recruiter</h2>

  <!-- Navigation -->
  <nav class="nav flex-column w-100 px-1">
    <a class="nav-link" href="Recrudashboard"><i class="fas fa-home me-2"></i> Dashboard</a>
    <a class="nav-link" href="insertjob"><i class="fas fa-plus-circle me-2"></i> Post Job/Intern</a>
    <a class="nav-link" href="recruiter/view-applicants"><i class="fas fa-file-alt me-2"></i>applications Recived</a>
    <a class="nav-link" href="viewrecruiterprofile"><i class="fas fa-user-check me-2"></i> View profile </a>
    <a class="nav-link" href="recruiterprofile"><i class="fas fa-user me-2"></i> My Profile</a>
  </nav>

  <!-- Logout -->
  <div class="logout-btn mt-4">
    <a href="logout" class="btn btn-outline-light w-100">
      <i class="fas fa-sign-out-alt me-2"></i> Logout
    </a>
  </div>
</div>
