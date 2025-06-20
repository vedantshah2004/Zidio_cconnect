package com.dao.Recruiter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.UserBean;

@Repository
public class JobApplicationDao {

    @Autowired
    JdbcTemplate stmt;

    public void applyToJob(int userId, int jobId) {
        String sql = "INSERT INTO job_applications (user_id, job_id) VALUES (?, ?)";
        stmt.update(sql, userId, jobId);
    }

    public List<UserBean> getApplicantsByJobId(int jobId) {
        String sql = "SELECT u.* FROM job_applications ja JOIN user u ON ja.user_id = u.id WHERE ja.job_id = ?";
        return stmt.query(sql, new BeanPropertyRowMapper<>(UserBean.class), jobId);
    }
}
