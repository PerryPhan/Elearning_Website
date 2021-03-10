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
@Table(name="Test")
public class Test {
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	@Column(name="name")
	private String name;
	

	@Column(name="time")
	private float time;
	
	@Column(name="pdf")
	private String pdf;
	

	@Column(name="question")
	private int question;
	

	@Column(name="answer")
	private String answer;

	@ManyToOne
	@JoinColumn(name="CourseId")
	private Course courseidt;
	
	@OneToMany(mappedBy="testid",fetch=FetchType.EAGER)
	private List<Result> result;
	
	public int getId() {
		return id;
	}

	public List<Result> getResult() {
		return result;
	}

	public void setResult(List<Result> result) {
		this.result = result;
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

	public float getTime() {
		return time;
	}

	public void setTime(float time) {
		this.time = time;
	}

	public String getPdf() {
		return pdf;
	}

	public void setPdf(String pdf) {
		this.pdf = pdf;
	}

	public int getQuestion() {
		return question;
	}

	public void setQuestion(int question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Course getCourseidt() {
		return courseidt;
	}

	public void setCourseidt(Course courseidt) {
		this.courseidt = courseidt;
	}

	
}
