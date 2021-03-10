package app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Details")
public class Detail {
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	@Column(name="cash")
	private double cash;
	
	@Column(name="process")
	private int process =1;
	
	
	public int getProcess() {
		return process;
	}

	public void setProcess(int process) {
		this.process = process;
	}

	@ManyToOne
	@JoinColumn(name="CourseId")
	private Course courseidd;
	
	@ManyToOne
	@JoinColumn(name="CartId")
	private Cart cartid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getCash() {
		return cash;
	}

	public void setCash(double cash) {
		this.cash = cash;
	}

	public Course getCourseidd() {
		return courseidd;
	}

	public void setCourseidd(Course courseid) {
		this.courseidd = courseid;
	}

	public Cart getCartid() {
		return cartid;
	}

	public void setCartid(Cart cartid) {
		this.cartid = cartid;
	}
}
