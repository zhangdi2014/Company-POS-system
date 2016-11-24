package com.entity;

import java.util.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
public class ProviderBack {
	private String pbid;
	private String pid;
	private String sid;
	private Date pbdate;
	public ProviderBack(){}
	public ProviderBack(String pbid,String pid,String sid,Date pbdate){
		this.pbid = pbid;
		this.pid = pid;
		this.sid = sid;
		this.pbdate = pbdate;
	}
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "pbid") 
	public String getPbid() {
		return pbid;
	}
	
	public void setPbid(String pbid) {
		this.pbid = pbid;
	}
	@Column(name="pid",length=20,nullable=false)
	public String getPid() {
		return pid;
	}
	
	public void setPid(String pid) {
		this.pid = pid;
	}
	@Column(name="sid",length=20,nullable=false)
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	@Column(name="pbdate",nullable=false)
	public Date getPbdate() {
		return pbdate;
	}
	public void setPbdate(Date pbdate) {
		this.pbdate = pbdate;
	}
}
