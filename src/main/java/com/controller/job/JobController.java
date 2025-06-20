package com.controller.job;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.JobBean;
import com.bean.RecruiterBean;
import com.dao.Recruiter.JobDao;

import jakarta.servlet.http.HttpSession;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class JobController {

    @Autowired
    JobDao jobDao;

    @GetMapping("insertjob")
    public String InsertJob()
    {
    	return "JobPost";
    }
    
    @PostMapping("postjob")
    public String postJob(@ModelAttribute JobBean job, HttpSession session, Model model) {
        RecruiterBean recruiter = (RecruiterBean) session.getAttribute("recruiter");
        if (recruiter != null) {
            job.setRecruiterId(recruiter.getId());
            jobDao.addJob(job);
            session.setAttribute("toast", "Job/Internship Posted Successfully!");
            session.setAttribute("toastType", "success");
        } else {
            session.setAttribute("toast", "Login as recruiter to post.");
            session.setAttribute("toastType", "error");
        }
        return "redirect:/Recrudashboard";
    }

    @GetMapping("viewjobs")
    public String viewJobs(Model model) {
        List<JobBean> jobs = jobDao.getAllJobs();
        model.addAttribute("jobs", jobs);
        return "view-jobs"; // Create this JSP to show jobs to users
    }
    
//    @GetMapping("/recruiter/delete-job")
//    public String deleteJob(@RequestParam("jobId") int jobId) {
//        jobApplicationDao.deleteJobById(jobId);
//        return "redirect:/recruiter/dashboard";
//    }

}
