package app.entity;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="Users")
public class User {
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	@Column(name="Firstname")
	private String firstname;
	
	@Column(name="Lastname")
	private String lastname;
	
	@Column(name="Email")
	private String email;
	
	@Column(name="Password")
	private String password;
	
	
	@Column(name="Birthday")
	private String birthday;
	
	@Column(name="Gender")
	private boolean gender;
	
	@Column(name="Role")
	private int role =4 ;
	// 1 - ADMIN 
	// 2 - SUPPORT
	// 3 - TEACHER 
	// 0 - LEARNER
	@Column(name="income")
	private double income =0;
	
	@OneToMany(mappedBy="instruid",fetch=FetchType.EAGER)
	private List<Course> course;
	
	@OneToMany(mappedBy="useridc",fetch=FetchType.EAGER)
	private List<Cart> cart;
	
	@OneToMany(mappedBy="useridr",fetch=FetchType.EAGER)
	private List<Result> result;
	
	
	public double getIncome() {
		return income;
	}

	public void setIncome(double income) {
		this.income = income;
	}

	public List<Course> getCourse() {
		return course;
	}

	public void setCourse(List<Course> course) {
		this.course = course;
	}

	public List<Cart> getCart() {
		return cart;
	}

	public void setCart(List<Cart> cart) {
		this.cart = cart;
	}

	public List<Result> getResult() {
		return result;
	}

	public void setResult(List<Result> result) {
		this.result = result;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
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

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public boolean getGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}
	
	
}
