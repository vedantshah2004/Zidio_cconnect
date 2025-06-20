# ZIDIOConnect

ZIDIOConnect is a dynamic web-based platform built using **Spring Boot** and **JSP**, designed to seamlessly connect **students** with **recruiters** for job and internship opportunities. The platform also includes an **admin dashboard**, **Excel-based data analysis**, and **interactive chart generation** to assist recruiters and admins in making data-driven decisions.

---

## 🔧 Configuration

### 📄 `application.properties`

> **IMPORTANT:** Before running the project, update the following properties in `src/main/resources/application.properties`:

spring.mail.username=your_email_here
spring.mail.password=your_password_here

spring.mail.username=your_email_here
spring.mail.password=your_password_here

## 🔍 Features

### 👨‍🎓 Student Portal
- Student registration and login
- Profile management (education, skills, resume)
- Browse and apply to job/internship opportunities
- Track application status

### 🧑‍💼 Recruiter Dashboard
- Recruiter registration and login
- Post job/internship opportunities
- View applicants for each job
- Manage company profile (name, designation, website)

### 🛡️ Admin Dashboard
- Admin login (secured)
- Manage all users (students and recruiters)
- View, edit, or delete job/internship postings
- Monitor overall platform activity and data usage
- Access analytics and charts for system usage



---

## 🛠️ Technologies Used

- **Backend:** Spring Boot (Spring JDBC Template)
- **Frontend:** JSP, HTML, CSS, Bootstrap
- **Database:** MySQL

---

## 🚀 Getting Started

### Prerequisites
- Java 17+
- Maven
- MySQL
- IDE (e.g., IntelliJ, Eclipse)

### Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-username/zidio_cConnect.git
   cd zidio_cConnect




tables---->

🛠️ MySQL Database Tables
ZIDIOConnect uses the following schema:

1. user
Stores student login and registration data.

Field	Type	Description
id	int (PK)	Auto-incremented ID
firstname	varchar(50)	Student's first name
lastname	varchar(50)	Student's last name
email	varchar(100)	Unique email
password	varchar(255)	Hashed password

2. recruiter
Stores recruiter login and registration info.

Field	Type	Description
id	int (PK)	Auto-incremented ID
firstname	varchar(50)	Recruiter's first name
lastname	varchar(50)	Recruiter's last name
email	varchar(100)	Unique email
password	varchar(255)	Hashed password

3. admin
Admin login and dashboard access.

Field	Type	Description
id	int (PK)	Auto-incremented ID
firstname	varchar(50)	Admin first name
lastname	varchar(50)	Admin last name
email	varchar(100)	Unique email
password	varchar(255)	Hashed password

4. student_profile
Extended student profile details.

Field	Type	Description
user_id	int (PK, FK)	Linked to user.id
university	varchar(100)	Name of the university
degree	varchar(100)	Degree or course name
year_of_study	int	Current academic year
resume_url	varchar(255)	Link to uploaded resume

5. recruiter_profile
Extended recruiter/company info.

Field	Type	Description
user_id	int (PK, FK)	Linked to recruiter.id
company_name	varchar(100)	Name of the company
designation	varchar(100)	Role/designation
company_website	varchar(255)	Link to company website

6. jobs
Job or internship postings created by recruiters.

Field	Type	Description
id	int (PK)	Auto-incremented job ID
recruiter_id	int (FK)	Linked to recruiter.id
title	varchar(100)	Job title
description	text	Job/internship description
location	varchar(100)	Location (optional)
job_type	enum('job','internship')	Type of opportunity
posted_date	timestamp	Auto-set post date

7. job_applications
Tracks who applied for what and when.

Field	Type	Description
id	int (PK)	Application ID
user_id	int (FK)	Linked to user.id
job_id	int (FK)	Linked to jobs.id
applied_date	timestamp	Auto-set when application created
