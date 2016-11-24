package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class ProviderInfo {
	private String pid;
	private String pname;
	private String plinkman;
	private String paddress;
	private String ptel;
	private String pemail;
	private String premark;
	
	public ProviderInfo(){}
	public ProviderInfo(String pid,String pname,String plinkman,String paddress,String ptel,String pemail,String premark){
		this.pid = pid;
		this.pname = pname;
		this.plinkman = plinkman;
		this.paddress = paddress;
		this.ptel = ptel;
		this.pemail = pemail;
		this.premark = premark;
	}
	@Id
//	@GeneratedValue(strategy = GenerationType.AUTO)
	@GeneratedValue(generator="system_uuid")
    @GenericGenerator(name="system_uuid",strategy="uuid")
    @Column(name = "pid") 
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	@Column(name="pname",length=50,nullable=false)
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	@Column(name="plinkman",length=50,nullable=false)
	public String getPlinkman() {
		return plinkman;
	}
	public void setPlinkman(String plinkman) {
		this.plinkman = plinkman;
	}
	@Column(name="paddress",length=50,nullable=false)
	public String getPaddress() {
		return paddress;
	}
	public void setPaddress(String paddress) {
		this.paddress = paddress;
	}
	@Column(name="ptel",length=20,nullable=false)
	public String getPtel() {
		return ptel;
	}
	public void setPtel(String ptel) {
		this.ptel = ptel;
	}
	@Column(name="pemail",length=50,nullable=false)
	public String getPemail() {
		return pemail;
	}
	public void setPemail(String pemail) {
		this.pemail = pemail;
	}
	@Column(name="premark",length=200,nullable=false)
	public String getPremark() {
		return premark;
	}
	public void setPremark(String premark) {
		this.premark = premark;
	}	
}
