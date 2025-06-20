package com.dao.Recruiter;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.JobBean;

@Repository
public class JobDao {
    
    @Autowired
    JdbcTemplate stmt;

    public void addJob(JobBean job) {
        String sql = "INSERT INTO jobs (recruiter_id, title, description, location, job_type) VALUES (?, ?, ?, ?, ?)";
        stmt.update(sql, job.getRecruiterId(), job.getTitle(), job.getDescription(), job.getLocation(), job.getJobType());
    }

    public List<JobBean> getAllJobs() {
        return stmt.query("SELECT * FROM jobs ORDER BY posted_date DESC", new BeanPropertyRowMapper<>(JobBean.class));
    }

    public List<JobBean> getJobsByRecruiter(int recruiterId) {
        return stmt.query("SELECT * FROM jobs WHERE recruiter_id = ? ORDER BY posted_date DESC",
                new BeanPropertyRowMapper<>(JobBean.class), recruiterId);
    }
}
