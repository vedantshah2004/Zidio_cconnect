package com.controller;

import java.io.IOException;
import java.io.InputStream;
import java.lang.ProcessBuilder.Redirect;
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
import com.ZidioConnectApplication;
import com.bean.AdminBean;
import com.bean.UserBean;
import com.dao.AdminDao;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Controller
public class AdminController {

	
	@Autowired
	PasswordEncoder passencode;
	
	@Autowired 
	private AdminDao admindao;

	@Autowired 
	private JdbcTemplate stmt;
	
	@Autowired
   private JavaMailSender mailSender;
	
	
	
	@GetMapping("listadmin")
	public String listAdmin(Model model)
	{
		List<AdminBean> admin=admindao.getAllAdmin();
		model.addAttribute("admin",admin);
		return "ListAdmin";
	}
	
	@GetMapping("deleteadmin")
	public String deleteAdmin(Integer id)
	{
		System.out.println(id);
		String deleteQuery="Delete from admin where id= ?";
		stmt.update(deleteQuery,id);
		return "redirect:/listAdmin";
	}



	@PostMapping("saveadmin")
	public String Saveadmin(@Validated AdminBean admin,BindingResult result,Model model)
	{
		model.addAttribute("result", result);
        System.out.println(admin.getFirstname());
        
        
        if (result.hasErrors()) {
            model.addAttribute("res", result);
            return "Signup";
        }
        
        else {
    
        	//Encryption
//        	BCryptPasswordEncoder bcrypt= new BCryptPasswordEncoder();
        	String epwd=passencode.encode(admin.getPassword());
        	admin.setPassword(epwd);//60
        	
        	
        //insert in db
        	admindao.addadmin(admin);
		
		 try {
             MimeMessage message = mailSender.createMimeMessage();
             MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
             String htmlContent = loadEmailTemplate("templates/welcomeadmin.jsp"); // Should ideally be HTML
             
             htmlContent = htmlContent.replace("${firstname}", admin.getFirstname());
             helper.setTo(admin.getEmail());
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
