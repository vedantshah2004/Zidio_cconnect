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

import com.bean.UserBean;
import com.dao.UserDao;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Controller
public class UserController {

	@Autowired
	PasswordEncoder passencode;
	
	@Autowired 
	UserDao udao;


	@Autowired
   private JavaMailSender mailSender;
	
	
	@Autowired 
	private JdbcTemplate stmt;
	

	
	
//	@GetMapping("adminlistusers")
//	public String adminlistUsers(Model model)
//	{
//		List<UserBean> user=udao.getAllUsers();
//		model.addAttribute("user",user);
//		return "AdminDashboard";
//	}
	
	
	
	@GetMapping("listusers")
	public String listUsers(Model model)
	{
		List<UserBean> user=udao.getAllUsers();
		model.addAttribute("user",user);
		return "ListUser";
	}
	
	@GetMapping("deleteuser")
	public String deleteUser(Integer id)
	{
		System.out.println(id);
		String deleteQuery="Delete from user where id= ?";
		stmt.update(deleteQuery,id);
		return "redirect:/listusers";
	}
	
	
	
	@PostMapping("saveuser")
	public String Saveuser(@Validated UserBean user,BindingResult result,Model model)
	{
		model.addAttribute("result", result);
        System.out.println(user.getFirstname());
        
        
        if (result.hasErrors()) {
            model.addAttribute("res", result);
            return "Signup";
        }
        
        else {
        	
        	
        	
        	//Encryption
//        	BCryptPasswordEncoder bcrypt= new BCryptPasswordEncoder();
        	String epwd=passencode.encode(user.getPassword());
        	user.setPassword(epwd);//60
        	
        	
        //insert in db
		udao.addUser(user);
		
		 try {
             MimeMessage message = mailSender.createMimeMessage();
             MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
             String htmlContent = loadEmailTemplate("templates/welcomemail.jsp"); // Should ideally be HTML
             
             htmlContent = htmlContent.replace("${firstname}", user.getFirstname());
             helper.setTo(user.getEmail());
             helper.setFrom("deepraval06012006@gmail.com");
             helper.setText(htmlContent, true);
             helper.setSubject("Welcome to Zidio Connect");

             mailSender.send(message);

         } catch (MessagingException | IOException e) {
             e.printStackTrace();
         }
		 
		 
		 	return "Login";
        }
        
	}
	
	
	
		private String loadEmailTemplate(String path) throws IOException
		{
	    		ClassPathResource resource = new ClassPathResource(path);
	    		try (InputStream inputStream = resource.getInputStream())
	    		{
	    			return new String(inputStream.readAllBytes(), StandardCharsets.UTF_8);
	    		}
		}
		
		
	
}
