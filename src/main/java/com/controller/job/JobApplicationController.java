package com.controller.job;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.UserBean;
import com.dao.Recruiter.JobApplicationDao;

import jakarta.servlet.http.HttpSession;

@Controller
public class JobApplicationController {

    @Autowired
    JobApplicationDao jobApplicationDao;

    @GetMapping("/apply")
    public String applyToJob(@RequestParam("jobId") int jobId, HttpSession session) {
        UserBean user = (UserBean) session.getAttribute("user");
        if (user != null) {
            jobApplicationDao.applyToJob(user.getId(), jobId);
        }
        return "redirect:/viewjobs";
    }

    @GetMapping("/recruiter/view-applicants")
    public String viewApplicants(@RequestParam("jobId") int jobId, Model model) {
        List<UserBean> applicants = jobApplicationDao.getApplicantsByJobId(jobId);
        model.addAttribute("applicants", applicants);
        return "recruiter/view-applicants";
    }
}
