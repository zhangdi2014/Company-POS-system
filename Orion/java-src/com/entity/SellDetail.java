package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
public class SellDetail {
	private String edid;
	private String eid;
	private String gid;
	private int edamount;
	private double edprice;
	private double edtotalprice;
	public SellDetail(){}
	public SellDetail(String edid,String eid,String gid,int edamount,double edprice,double edtotalprice){
		this.edid = edid;
		this.eid = eid;
		this.gid = gid;
		this.edamount = edamount;
		this.edprice = edprice;
		this.edtotalprice = edtotalprice;
	}
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "edid") 
	public String getEdid() {
		return edid;
	}
	public void setEdid(String edid) {
		this.edid = edid;
	}
	@Column(name="eid",length=20,nullable=false)
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
	}
	@Column(name="gid",length=20,nullable=false)
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	@Column(name="edamount",nullable=false)
	public int getEdamount() {
		return edamount;
	}
	public void setEdamount(int edamount) {
		this.edamount = edamount;
	}
	@Column(name="edprice",nullable=false)
	public double getEdprice() {
		return edprice;
	}
	public void setEdprice(double edprice) {
		this.edprice = edprice;
	}
	@Column(name="edtotalprice",nullable=false)
	public double getEdtotalprice() {
		return edtotalprice;
	}
	public void setEdtotalprice(double edtotalprice) {
		this.edtotalprice = edtotalprice;
	}
}
