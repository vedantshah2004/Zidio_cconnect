package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.bean.RecruiterProfileBean;
import com.dao.Recruiter.RecruiterProfileDao;
//import com.bean.RecruiterBean;

import jakarta.servlet.http.HttpSession;

@Controller
public class RecruiterProfileController {
	
	

//	@Autowired
//	RecruiterBean rbean;
	
    	@Autowired
    RecruiterProfileDao recruiterProfileDao;

    // Display form (view or edit)
    	@GetMapping("recruiterprofile")
    	public ModelAndView showRecruiterProfile(HttpSession session) {
    	    // Step 1: Get recruiterId from session
    	    Integer recruiterId = (Integer) session.getAttribute("recruiterId");
    	    System.out.println("Session recruiterId = " + recruiterId);

    	    // Step 2: Create view object
    	    ModelAndView modelAndView = new ModelAndView("recruiterprofile");

    	    // Step 3: If session has valid recruiterId
    	    if (recruiterId != null) {
    	        // Step 3a: Try to fetch profile from DB
    	        RecruiterProfileBean profile = recruiterProfileDao.getRecruiterProfileByUserId(recruiterId);

    	        // Step 3b: If profile exists, send it to JSP
    	        if (profile != null) {
    	            modelAndView.addObject("recruiterProfileBean", profile);
    	        } 
    	        // Step 3c: If not, create empty profile and prefill recruiterId
    	        else {
    	            RecruiterProfileBean newProfile = new RecruiterProfileBean();
    	            newProfile.setRecruiterId(recruiterId); // ✅ This line is important for binding hidden field
    	            modelAndView.addObject("recruiterProfileBean", newProfile);
    	        }
    	    } 
    	    // Step 4: No valid session, go to login
    	    else {
    	        modelAndView.setViewName("redirect:/login");
    	    }

    	    // Step 5: Return view
    	    return modelAndView;
    	}


    // Save or update profile
    	@PostMapping("saverecruiterprofile")
    	public String saveRecruiterProfile(@ModelAttribute("recruiterProfileBean") RecruiterProfileBean profileBean, HttpSession session) {
    	    
    	    // Fallback if recruiterId is not passed from the form
    	    if (profileBean.getRecruiterId() == null) {
    	        Integer recruiterId = (Integer) session.getAttribute("recruiterId");
    	        if (recruiterId != null) {
    	            profileBean.setRecruiterId(recruiterId);
    	        } else {
    	            return "redirect:/login"; // If session is also empty
    	        }
    	    }

    	    // Check if profile already exists
    	    RecruiterProfileBean existing = recruiterProfileDao.getRecruiterProfileByUserId(profileBean.getRecruiterId());

    	    if (existing == null) {
    	        recruiterProfileDao.insertRecruiterProfile(profileBean);
    	    } else {
    	        recruiterProfileDao.updateRecruiterProfile(profileBean);
    	    }

    	    return "redirect:/recruiterprofile"; // Reload profile page
    	}


    
    
    @PostMapping("updaterecruiterprofile")
    public String updateRecruiterProfile(@ModelAttribute("recruiterProfileBean") RecruiterProfileBean profileBean) {
        recruiterProfileDao.updateRecruiterProfile(profileBean);
        return "redirect:/recruiterprofile";
    }
    
    
    
    
    
    @GetMapping("viewrecruiterprofile")
    public ModelAndView viewRecruiterProfile(HttpSession session) {
        Integer recruiterId = (Integer) session.getAttribute("recruiterId");

        ModelAndView modelAndView = new ModelAndView("viewrecruiterprofile");

        if (recruiterId != null) {
            RecruiterProfileBean profile = recruiterProfileDao.getRecruiterProfileByUserId(recruiterId);
            if (profile != null) {
                modelAndView.addObject("profile", profile);
            } else {
                modelAndView.addObject("error", "No profile data found.");
            }
        } else {
            modelAndView.setViewName("redirect:/login");
        }

        return modelAndView;
    }


}
