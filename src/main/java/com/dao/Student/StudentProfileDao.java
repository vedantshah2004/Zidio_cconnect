package com.dao.Student;

import com.bean.StudentProfileBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class StudentProfileDao {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public void insertStudentProfile(StudentProfileBean profile) {
        String sql = "INSERT INTO student_profile (user_id, university, degree, year_of_study, resume_url) VALUES (?, ?, ?, ?, ?)";

        jdbcTemplate.update(sql,
            profile.getUserId(),
            profile.getUniversity(),
            profile.getDegree(),
            profile.getYearOfStudy(),
            profile.getResumeUrl()
        );
        
        
    }
    
    public void updateStudentProfile(StudentProfileBean profile) {
        String sql = "UPDATE student_profile SET university = ?, degree = ?, year_of_study = ?, resume_url = ? WHERE user_id = ?";

        jdbcTemplate.update(sql,
            profile.getUniversity(),
            profile.getDegree(),
            profile.getYearOfStudy(),
            profile.getResumeUrl(),
            profile.getUserId()
        );
    }
    
    public StudentProfileBean getStudentProfileByUserId(int userId) {
        String sql = "SELECT * FROM student_profile WHERE user_id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{userId}, (rs, rowNum) -> {
                StudentProfileBean profile = new StudentProfileBean();
                profile.setUserId(userId);
                profile.setUniversity(rs.getString("university"));
                profile.setDegree(rs.getString("degree"));
                profile.setYearOfStudy(rs.getInt("year_of_study"));
                profile.setResumeUrl(rs.getString("resume_url"));
                return profile;
            });
        } catch (Exception e) {
            return null; // not found
        }
    }



}
