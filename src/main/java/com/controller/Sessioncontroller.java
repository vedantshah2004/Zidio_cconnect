package com.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.AdminBean;
import com.bean.RecruiterBean;
import com.bean.UserBean;
import com.dao.AdminDao;
import com.dao.RecruiterDao;
import com.dao.UserDao;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpSession;

@Controller
public class Sessioncontroller {

	@Autowired
	PasswordEncoder passencode;
	
	@Autowired
	AdminDao adao;
	
	@Autowired
	RecruiterDao rdao;
	
	@Autowired 
	UserDao udao;


	@Autowired
   private JavaMailSender mailSender;
	
	
	@Autowired 
	private JdbcTemplate stmt;
	
	@GetMapping("admindashboard")
	public String adminlistUsers(Model model)
	{
		List<UserBean> user=udao.getAllUsers();
		List<RecruiterBean> recru=rdao.getAllrec();

		model.addAttribute("user",user);
		model.addAttribute("recru",recru);

		return "AdminDashboard";
	}
	
	
	@GetMapping("userdashboard")
	public String userdashboard()
	{
		return "UserDashboard";
	}
	
	
	
	
	
	
	
	@GetMapping(value={"login","/"})
	public String openLogin()
	{
		return "Login";
	}
	
	
	@GetMapping("signup")
	public String opensignup()
	{
		return "Signup";
	}
	
	@PostMapping("/login")
	public String authenticate(
	        @RequestParam String email,
	        @RequestParam String password,
	        Model model,
	        HttpSession session) {

	    UserBean userBean = udao.authenticateuser(email);
	    AdminBean adminBean = adao.authenticateadmin(email);
	    RecruiterBean recruiterBean = rdao.authenticaterecruiter(email);

	    if (userBean != null && passencode.matches(password, userBean.getPassword())) {
	        session.setAttribute("user", userBean);
	        session.setAttribute("toast", "User Login Successful");
	        return "redirect:/userdashboard";
	    } else if (adminBean != null && passencode.matches(password, adminBean.getPassword())) {
	        session.setAttribute("admin", adminBean);
	        session.setAttribute("toast", "Admin Login Successful");
	        return "redirect:/admindashboard";
	    } else if (recruiterBean != null && passencode.matches(password, recruiterBean.getPassword())) {
	        session.setAttribute("recruiter", recruiterBean);
	        session.setAttribute("recruiterId", recruiterBean.getId());
	        session.setAttribute("toast", "Recruiter Login Successful");
	        return "redirect:/Recrudashboard";
	    } else {
	        model.addAttribute("error", "Invalid credentials");
	        return "Login";
	    }

	}

	


	
	
	@GetMapping("forgetpassword")
	public String openforgetpass() {
	    return "ForgetPassword";
	}

	@PostMapping("sendotp")
	public String sendOtp(String email, Model model, HttpSession session) {
	    UserBean user = udao.findByEmailuser(email);
	    AdminBean admin = adao.findByEmailadmin(email);
	    RecruiterBean recruiter = rdao.findByEmailrecruiter(email);

	    if (user == null && admin == null && recruiter == null) {
	        model.addAttribute("error", "Email not registered.");
	        return "ForgetPassword";
	    }

	    int otp = (int)(Math.random() * 900000) + 100000;

	    session.setAttribute("otp", otp);
	    session.setAttribute("otpEmail", email);

	    String name = "";
	    String role = "";

	    if (user != null) {
	        name = user.getFirstname();
	        role = "user";
	    } else if (admin != null) {
	        name = admin.getFirstname();
	        role = "admin";
	    } else if (recruiter != null) {
	        name = recruiter.getFirstname();
	        role = "recruiter";
	    }

	    session.setAttribute("role", role);

	    try {
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

	        String subject = "Your OTP for Password Reset";
	        String content = "<h3>Hello " + name + ",</h3>"
	                + "<p>Your OTP for password reset is: <strong style='font-size: 18px;'>" + otp + "</strong></p>"
	                + "<p>Please use this OTP to reset your password.</p>"
	                + "<p>If you did not request this, please ignore this email.</p>";

	        helper.setTo(email);
	        helper.setFrom("deepraval06012006@gmail.com");
	        helper.setSubject(subject);
	        helper.setText(content, true);

	        mailSender.send(message);

	        model.addAttribute("message", "OTP sent to your email.");
	        return "enterotp";

	    } catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("error", "Failed to send OTP. Please try again.");
	        return "ForgetPassword";
	    }
	}

	@GetMapping("/resetpassword")
	public String showResetPasswordPage() {
	    return "resetpassword";
	}

	@PostMapping("/verifyotp")
	public String verifyOtp(String email, int otp, HttpSession session, Model model) {
	    Object sessionOtp = session.getAttribute("otp");
	    Object sessionEmail = session.getAttribute("otpEmail");

	    if (sessionOtp == null || sessionEmail == null || !email.equals(sessionEmail)) {
	        model.addAttribute("error", "Session expired or invalid email.");
	        return "Login";
	    }

	    if ((int) sessionOtp != otp) {
	        model.addAttribute("error", "Invalid OTP.");
	        return "enterotp";
	    }

	    session.removeAttribute("otp");
	    session.setAttribute("verifiedEmail", email);

	    return "redirect:/resetpassword";
	}

	@PostMapping("/savepassword")
	public String savePassword(String newPassword, String confirmPassword, HttpSession session, Model model) {
	    String email = (String) session.getAttribute("verifiedEmail");
	    String role = (String) session.getAttribute("role");

	    if (email == null || role == null) {
	        model.addAttribute("error", "Session expired. Please restart password reset.");
	        return "Login";
	    }

	    if (!newPassword.equals(confirmPassword)) {
	        model.addAttribute("error", "Passwords do not match.");
	        return "resetpassword";
	    }

	    // ✅ Encode the new password
	    String hashedPassword = passencode.encode(newPassword);

	    String sql = "";
	    if (role.equals("user")) {
	        sql = "UPDATE user SET password=? WHERE email=?";
	    } else if (role.equals("admin")) {
	        sql = "UPDATE admin SET password=? WHERE email=?";
	    } else if (role.equals("recruiter")) {
	        sql = "UPDATE recruiter SET password=? WHERE email=?";
	    }

	    stmt.update(sql, hashedPassword, email); // ✅ Save encoded password

	    session.removeAttribute("verifiedEmail");
	    session.removeAttribute("role");

	    model.addAttribute("msg", "New password saved successfully!");
	    return "Login";
	}

	
	
	@GetMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes ra) {
	    session.invalidate();
	    ra.addFlashAttribute("toast", "Logout successful!");
	    ra.addFlashAttribute("toastType", "success");
	    return "redirect:/login";
	}

	
}
