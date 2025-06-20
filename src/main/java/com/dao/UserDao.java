package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.UserBean;

@Repository
public class UserDao {
	@Autowired
	JdbcTemplate stmt;
	
	
	// return type no return type
	// argument type user bean
	public void addUser(UserBean user) {
		
		stmt.update("insert into user(firstname,lastname,email,password) VALUES (?,?,?,?)",
		user.getFirstname(),user.getLastname(),user.getEmail(),user.getPassword());
		
	}
	
	
	//select * from users
			public List<UserBean> getAllUsers()
			{
				List<UserBean> users=stmt.query("Select * from user",new BeanPropertyRowMapper<>(UserBean.class));
					
				return users;
			}
			
			
			
			
			
			public UserBean authenticateuser(String email)
			{
				try {
				UserBean user =stmt.queryForObject("select * from user where email =? ",new BeanPropertyRowMapper<>(UserBean.class),email);	
				return user;
				}
				catch (Exception e) {
					return null;
				
				}
			}
			
			
			public UserBean findByEmailuser(String email) {
			    try {
			        return stmt.queryForObject(
			            "SELECT * FROM user WHERE email = ?", 
			            new BeanPropertyRowMapper<>(UserBean.class),
			            email
			        );
			    } catch (Exception e) {
			        return null;
			    }
			}
}
