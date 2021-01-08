package model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="employee")
public class EmployeeBean {
	private String name;
	@Id
	private String eid;
	private String uid;
	private byte[] pwd;
	private Integer bankaccount;
	private String position;
	
	@Override
	public String toString() {
		return "EmployeeBean [name=" + name + ", eid=" + eid + ", uid=" + uid + ", bankaccount=" + bankaccount
				+ ", position=" + position + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public byte[] getPwd() {
		return pwd;
	}
	public void setPwd(byte[] pwd) {
		this.pwd = pwd;
	}
	public Integer getBankaccount() {
		return bankaccount;
	}
	public void setBankaccount(Integer bankaccount) {
		this.bankaccount = bankaccount;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
}
