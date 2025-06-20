package com.controller;

import com.bean.StudentProfileBean;
import com.bean.UserBean;
import com.dao.Student.StudentProfileDao;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class StudentProfileController {

    @Autowired
    StudentProfileDao studentProfileDao;

    // Load the student profile form using user info from session
    @GetMapping("/studentprofile")
    public String loadStudentProfileForm(Model model, HttpSession session) {
        UserBean user = (UserBean) session.getAttribute("user"); // get user from session

        if (user == null) {
            return "redirect:/login"; // handle not logged in
        }

        StudentProfileBean profile = new StudentProfileBean();
        profile.setUserId(user.getId()); // set the user's id from session

        model.addAttribute("studentProfileBean", profile);
        return "Profile_Management";
    }

    // Handle form submission
    @PostMapping("/savestudentprofile")
    public String saveStudentProfile(@ModelAttribute("studentProfileBean") StudentProfileBean profileBean) {
        StudentProfileBean existingProfile = studentProfileDao.getStudentProfileByUserId(profileBean.getUserId());

        if (existingProfile != null) {
            studentProfileDao.updateStudentProfile(profileBean);
        } else {
            studentProfileDao.insertStudentProfile(profileBean);
        }

        return "redirect:/studentprofile"; // or wherever you want to redirect
    }
    
    
 // Load the update profile form with existing data
    @GetMapping("/updatestudentprofile")
    public String loadUpdateForm(Model model, HttpSession session) {
        UserBean user = (UserBean) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        StudentProfileBean existingProfile = studentProfileDao.getStudentProfileByUserId(user.getId());
        if (existingProfile == null) {
            existingProfile = new StudentProfileBean();
            existingProfile.setUserId(user.getId());
        }

        model.addAttribute("studentProfileBean", existingProfile);
        return "Profile_Management";
    }

    // Handle profile update submission
    @PostMapping("/updatestudentprofile")
    public String updateStudentProfile(@ModelAttribute("studentProfileBean") StudentProfileBean profileBean) {
        studentProfileDao.updateStudentProfile(profileBean);
        return "redirect:/studentprofile";
    }

   
    @GetMapping("/viewstudentprofile")
    public String viewStudentProfile(Model model, HttpSession session) {
        UserBean user = (UserBean) session.getAttribute("user");
        StudentProfileBean profile = studentProfileDao.getStudentProfileByUserId(user.getId());

        model.addAttribute("studentProfile", profile);
        return "student_profile_view";
    }

    
    
}
