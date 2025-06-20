package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.AdminBean;
import com.bean.RecruiterBean;
import com.bean.UserBean;

@Repository
public class RecruiterDao {
	@Autowired
	JdbcTemplate stmt;
	
	
	// return type no return type
	// argument type user bean
	public void addrec(RecruiterBean recbean) {
		
		stmt.update("insert into recruiter(firstname,lastname,email,password) VALUES (?,?,?,?)",
				recbean.getFirstname(),recbean.getLastname(),recbean.getEmail(),recbean.getPassword());
		
	}
	
	
	//select * from users
			public List<RecruiterBean> getAllrec()
			{
				List<RecruiterBean> recruiters=stmt.query("Select * from recruiter",new BeanPropertyRowMapper<>(RecruiterBean.class));
					
				return recruiters;
			}
			
			
			public RecruiterBean authenticaterecruiter(String email)
			{
				try {
					RecruiterBean recruiter =stmt.queryForObject("select * from recruiter where email =? ",new BeanPropertyRowMapper<>(RecruiterBean.class),email);	
				return recruiter;
				}
				catch (Exception e) {
					return null;
				
				}
			}
			
			
			public RecruiterBean findByEmailrecruiter(String email) {
			    try {
			        return stmt.queryForObject(
			            "SELECT * FROM recruiter WHERE email = ?", 
			            new BeanPropertyRowMapper<>(RecruiterBean.class),
			            email
			        );
			    } catch (Exception e) {
			        return null;
			    }
			}
}
