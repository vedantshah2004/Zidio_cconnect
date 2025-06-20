<!-- admin_sidebar.jsp -->
<div style="width: 250px; height: 100vh; background: linear-gradient(135deg, #2b5876, #4e4376); position: fixed; color: white; display: flex; flex-direction: column; align-items: center; padding-top: 40px; box-shadow: 5px 0 15px rgba(0,0,0,0.3); font-family: 'Segoe UI', sans-serif;">
    <!-- Admin Profile Image or Logo -->
    <div style="text-align: center; margin-bottom: 30px;">
        <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" style="width: 80px; height: 80px; border-radius: 50%; border: 3px solid white;">
        <h4 style="margin-top: 10px;">Admin Panel</h4>
    </div>

    <!-- Navigation -->
    <ul style="list-style: none; padding: 0; width: 100%;">
        <li style="padding: 15px 25px;"><a href="admindashboard" style="color: white; text-decoration: none;"><i class="fas fa-home me-2"></i>Dashboard</a></li>
        <li style="padding: 15px 25px;"><a href="listusers" style="color: white; text-decoration: none;"><i class="fas fa-users me-2"></i>Users</a></li>
        <li style="padding: 15px 25px;"><a href="listrecruiter" style="color: white; text-decoration: none;"><i class="fas fa-briefcase me-2"></i>Recruiters</a></li>
        <li style="padding: 15px 25px;"><a href="logout" style="color: white; text-decoration: none;"><i class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
    </ul>
</div>

<!-- Font Awesome for icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
