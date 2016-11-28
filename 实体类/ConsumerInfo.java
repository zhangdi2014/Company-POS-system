package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class ConsumerInfo {
	private String cid;
	private String cname;
	private String clinkman;
	private String caddress;
	private String ctel;
	private String cemail;
	private String cremark;
	
	public ConsumerInfo(){}
	public ConsumerInfo(String cid,String cname,String clinkman,
		String caddress,String ctel,String cemail,String cremark){
		this.cid = cid;
		this.cname = cname;
		this.clinkman = clinkman;
		this.caddress = caddress;
		this.ctel = ctel;
		this.cemail = cemail;
		this.cremark = cremark;
	}
	@Id
//	@GeneratedValue(strategy = GenerationType.AUTO)
	@GeneratedValue(generator="system_uuid")
    @GenericGenerator(name="system_uuid",strategy="uuid")
    @Column(name = "cid") 
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	@Column(name="cname",length=50,nullable=false)
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	@Column(name="clinkman",length=50,nullable=false)
	public String getClinkman() {
		return clinkman;
	}
	public void setClinkman(String clinkman) {
		this.clinkman = clinkman;
	}
	@Column(name="caddress",length=50,nullable=false)
	public String getCaddress() {
		return caddress;
	}
	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}
	@Column(name="ctel",length=20,nullable=false)
	public String getCtel() {
		return ctel;
	}
	public void setCtel(String ctel) {
		this.ctel = ctel;
	}
	@Column(name="cemail",length=50,nullable=false)
	public String getCemail() {
		return cemail;
	}
	public void setCemail(String cemail) {
		this.cemail = cemail;
	}
	@Column(name="cremark",length=200,nullable=false)
	public String getCremark() {
		return cremark;
	}
	public void setCremark(String cremark) {
		this.cremark = cremark;
	}
}
