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
public class ConsumerBack {
	private String cbid;
	private String cid;
	private String eid;
	private Date cbdate;
	public ConsumerBack(){}
	public ConsumerBack(String cbid,String cid,String eid,Date cbdate){
		this.cbid = cbid;
		this.cid = cid;
		this.eid = eid;
		this.cbdate = cbdate;
	}
	@Id 
	@GeneratedValue(generator="system_uuid")
    @GenericGenerator(name="system_uuid",strategy="uuid")// 表示主键
	//  @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "cbid")  
	public String getCbid() {
		return cbid;
	}
	public void setCbid(String cbid) {
		this.cbid = cbid;
	}
	@Column(name="cid",length=20,nullable=false)
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	@Column(name="eid",length=20,nullable=false)
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
	}
	@Column(name="cbdate",nullable=false)
	public Date getCbdate() {
		return cbdate;
	}
	public void setCbdate(Date cbdate) {
		this.cbdate = cbdate;
	}
}
