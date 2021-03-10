package app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Results")
public class Result {
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	@Column(name="correct")
	private int correct=0;
	
	@Column(name="rank")
	private String rank;
	
	@Column(name="day")
	private String day;
		
	@ManyToOne
	@JoinColumn(name="UserId")
	private User useridr;
	
	@ManyToOne
	@JoinColumn(name="TestId")
	private Test testid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCorrect() {
		return correct;
	}

	public void setCorrect(int correct) {
		this.correct = correct;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public User getUseridr() {
		return useridr;
	}

	public void setUseridr(User useridr) {
		this.useridr = useridr;
	}

	public Test getTestid() {
		return testid;
	}

	public void setTestid(Test testid) {
		this.testid = testid;
	}
	
}
