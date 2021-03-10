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
@Table(name="Cart")
public class Cart {
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	@Column(name="paid")
	private boolean paid;
	
	@Column(name="day")
	private String day;
	@OneToMany(mappedBy="cartid",fetch=FetchType.EAGER)
	private List<Detail> detail;
	@ManyToOne
	@JoinColumn(name="UserId")
	private User useridc;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isPaid() {
		return paid;
	}

	public void setPaid(boolean paid) {
		this.paid = paid;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public User getUseridc() {
		return useridc;
	}

	public void setUseridc(User useridc) {
		this.useridc = useridc;
	}

	public List<Detail> getDetail() {
		return detail;
	}

	public void setDetail(List<Detail> detail) {
		this.detail = detail;
	}

	

	
}
