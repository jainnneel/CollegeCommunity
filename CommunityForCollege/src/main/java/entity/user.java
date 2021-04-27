package entity;

import java.util.List;
import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;


import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Cacheable
@Cache(usage =CacheConcurrencyStrategy.READ_ONLY)
public class user {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String fname=null;
	private String lname=null;
	private String uname=null;
	private String email=null;
	private String pass=null;
	private String gender=null;
	private String dob=null;
	private String city=null;
	private String state=null;
	private String bio=null;
	private String profile=null;
	private String category= null;
	private String department=null;

	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}


	@OneToMany(mappedBy="u", cascade= CascadeType.ALL)
	private List<post> p;
	
	public List<post> getP() {
		return p;
	}
	public void setP(List<post> p) {
		this.p = p;
	}
	
	@OneToMany(mappedBy="u", cascade= CascadeType.ALL)
	private List<story> s;
	
	
	
	/*
	@ManyToMany
	private List<user> fl;
	
	public List<user> getFl() {
		return fl;
	}
	public void setFl(List<user> fl) {
		this.fl = fl;
	}
	*/
	
/*	@OneToMany(mappedBy="u")
	private List<category> l;
	

	public List<category> getL() {
		return l;
	}
	public void setL(List<category> l) {
		this.l = l;
	}
	*/
/*	@OneToMany(mappedBy = "ur")
	private List<liked> l;
	
	public List<liked> getL() {
		return l;
	}
	public void setL(List<liked> l) {
		this.l = l;
	}*/
	
	
	
	public List<story> getS() {
		return s;
	}
	public void setS(List<story> s) {
		this.s = s;
	}
	public user(int id, String fname, String lname, String uname, String email, String pass, String gender, String dob,
			String city, String state) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.uname = uname;
		this.email = email;
		this.pass = pass;
		this.gender = gender;
		this.dob = dob;
		this.city = city;
		this.state = state;
	}

	
	

	public user(String fname, String lname, String uname, String email, String pass, String gender, String dob,
			String city, String state) {
		super();
		this.fname = fname; 
		this.lname = lname;
		this.uname = uname;
		this.email = email;
		this.pass = pass;
		this.gender = gender;
		this.dob = dob;
		this.city = city;
		this.state = state;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public user() {
		super();
	}

	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getBio() {
		return bio;
	}


	public void setBio(String bio) {
		this.bio = bio;
	}


	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	
	
}