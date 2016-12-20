package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
public class GoodsClassInfo {
	private String gcid;
	private String gcname;
	
	public GoodsClassInfo(){}
	public GoodsClassInfo(String gcid,String gcname){
		this.gcid = gcid;
		this.gcname = gcname;
	}
	@Id
//	@GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "gcid") 
	public String getGcid() {
		return gcid;
	}
	public void setGcid(String gcid) {
		this.gcid = gcid;
	}
	@Column(name="gcname",length=50,nullable=false)
	public String getGcname() {
		return gcname;
	}
	public void setGcname(String gcname) {
		this.gcname = gcname;
	}
}
