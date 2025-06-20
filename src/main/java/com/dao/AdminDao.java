package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.AdminBean;
import com.bean.UserBean;

@Repository
public class AdminDao {
	@Autowired
	JdbcTemplate stmt;
	
	
	// return type no return type
	// argument type user bean
	public void addadmin(AdminBean admin) {
		
		stmt.update("insert into admin(firstname,lastname,email,password) VALUES (?,?,?,?)",
				admin.getFirstname(),admin.getLastname(),admin.getEmail(),admin.getPassword());
		
	}
	
	
	//select * from users
			public List<AdminBean> getAllAdmin()
			{
				List<AdminBean> admin=stmt.query("Select * from admin",new  BeanPropertyRowMapper<>(AdminBean.class));
					
				return admin;
			}
			
			public AdminBean authenticateadmin(String email)
			{
				try {
					AdminBean user =stmt.queryForObject("select * from admin where email =? ",new BeanPropertyRowMapper<>(AdminBean.class),email);	
				return user;
				}
				catch (Exception e) {
					return null;
				
				}
			}
			
			
			public AdminBean findByEmailadmin(String email) {
			    try {
			        return stmt.queryForObject(
			            "SELECT * FROM admin WHERE email = ?", 
			            new BeanPropertyRowMapper<>(AdminBean.class),
			            email
			        );
			    } catch (Exception e) {
			        return null;
			    }
			}
}
