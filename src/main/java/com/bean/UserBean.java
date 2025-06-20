package com.bean;

import jakarta.validation.constraints.NotBlank;

public class UserBean {

	private Integer  id;

	@NotBlank(message="Please Enter First Name")
	private String firstname;
	@NotBlank(message="Please Enter Last Name")
	private String lastname;
	@NotBlank(message="Please Enter email")
	private String email;
	@NotBlank(message="Please Enter Password")
	private String password;
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
