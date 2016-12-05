package com.entity;

import java.util.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
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
//	@GeneratedValue(strategy = GenerationType.AUTO)
<<<<<<< HEAD:Orion/java-src/com/entity/ProviderBack.java
=======
	@GeneratedValue(generator="system_uuid")
    @GenericGenerator(name="system_uuid",strategy="uuid")
>>>>>>> 10b44bf4fb6e3e9a1e4f1bd260ff99fd5357a3a3:实体类/ProviderBack.java
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
