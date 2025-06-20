package com.bean;

public class RecruiterProfileBean {
    private Integer recruiterId;           // FK to recruiter.id
    private String companyName;
    private String designation;
    private String companyWebsite;

    // Getters and Setters
    


    public String getCompanyName() {
        return companyName;
    }
    public Integer getRecruiterId() {
        return recruiterId;
    }

    // ✅ Setter
    public void setRecruiterId(Integer recruiterId) {
        this.recruiterId = recruiterId;
    }
	public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getDesignation() {
        return designation;
    }
    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getCompanyWebsite() {
        return companyWebsite;
    }
    public void setCompanyWebsite(String companyWebsite) {
        this.companyWebsite = companyWebsite;
    }
}
