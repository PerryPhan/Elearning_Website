package app.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Courses")
public class Course {
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="price")
	private double price;
	
	@Column(name="description")
	private String des;
	
	@ManyToOne
	@JoinColumn(name="MajorId")
	private Major majorid;

	@ManyToOne
	@JoinColumn(name="InstruId")
	private User instruid;
	
	@OneToMany(mappedBy="courseid",fetch=FetchType.EAGER)
	private List<Curriculum> curriculum;
	
	@OneToMany(mappedBy="courseidt",fetch=FetchType.EAGER)
	private List<Test> test;
	
	@OneToMany(mappedBy="courseidd",fetch=FetchType.EAGER)
	private List<Detail> detail;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public Major getMajorid() {
		return majorid;
	}

	public void setMajorid(Major majorid) {
		this.majorid = majorid;
	}

	public User getInstruid() {
		return instruid;
	}

	public void setInstruid(User instruid) {
		this.instruid = instruid;
	}

	public List<Curriculum> getCurriculum() {
		return curriculum;
	}

	public void setCurriculum(List<Curriculum> curriculum) {
		this.curriculum = curriculum;
	}

	public List<Test> getTest() {
		return test;
	}

	public void setTest(List<Test> test) {
		this.test = test;
	}

	public List<Detail> getCourse() {
		return detail;
	}

	public void setDetail(List<Detail> course) {
		this.detail = course;
	}
	
}
