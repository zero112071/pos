package model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
@Entity
@Table(name="recipe")
public class RecipeBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer tid;
	private String food;
	private Timestamp time;
	private Integer price;
	private Integer num;
	private Integer total;
	private String detailnum;
	@Transient
	private String picture;
	
	@Override
	public String toString() {
		return "RecipeBean [tid=" + tid + ", time=" + time + ", food=" + food + ", price=" + price + ", num=" + num
				+ ", total=" + total +  ", detailnum=" + detailnum +"]";
	}
	
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public String getFood() {
		return food;
	}
	public void setFood(String food) {
		this.food = food;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public String getDetailnum() {
		return detailnum;
	}
	public void setDetailnum(String detailnum) {
		this.detailnum = detailnum;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	
}
