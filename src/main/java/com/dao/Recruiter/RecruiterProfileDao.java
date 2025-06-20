package com.dao.Recruiter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.RecruiterProfileBean;

@Repository
public class RecruiterProfileDao {

    @Autowired
    JdbcTemplate jdbcTemplate;

    
    
    public void insertRecruiterProfile(RecruiterProfileBean profile) {
        String sql = "INSERT INTO recruiter_profile (user_id, company_name, designation, company_website) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql,
            profile.getRecruiterId(),
            profile.getCompanyName(),
            profile.getDesignation(),
            profile.getCompanyWebsite()
        );
    }

    public void updateRecruiterProfile(RecruiterProfileBean profile) {
        String sql = "UPDATE recruiter_profile SET company_name = ?, designation = ?, company_website = ? WHERE user_id = ?";
        jdbcTemplate.update(sql,
            profile.getCompanyName(),
            profile.getDesignation(),
            profile.getCompanyWebsite(),
            profile.getRecruiterId()
        );
    }
    
    
    public RecruiterProfileBean getRecruiterProfileByUserId(int userId) {
        try {
            String sql = "SELECT * FROM recruiter_profile WHERE user_id = ?";
            return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(RecruiterProfileBean.class), userId);
        } catch (Exception e) {
            return null;
        }
    }
    
    public void deleteJobById(int jobId) {
    	jdbcTemplate.update("DELETE FROM job_applications WHERE job_id = ?", jobId);
    	jdbcTemplate.update("DELETE FROM jobs WHERE id = ?", jobId);
    }


}
