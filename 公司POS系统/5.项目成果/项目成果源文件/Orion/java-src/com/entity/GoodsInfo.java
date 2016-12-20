package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
public class GoodsInfo {
	private String gid;
	private String gname;
	private String gcid;
	private String gunit;
	private double gpin;
	private double gpout;
	private int gamount;
	public GoodsInfo(){}
	public GoodsInfo(String gid,String gname,String gcid,
		String gunit,double gpin,double gpout,int gamount){
		this.gid = gid;
		this.gname = gname;
		this.gcid = gcid;
		this.gunit = gunit;
		this.gpin = gpin;
		this.gpout = gpout;
		this.gamount = gamount;
	}
	@Id
//	@GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "gid") 
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	@Column(name="gname",length=50,nullable=false)
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	@Column(name="gcid",length=20,nullable=false)
	public String getGcid() {
		return gcid;
	}
	public void setGcid(String gcid) {
		this.gcid = gcid;
	}
	@Column(name="gunit",length=10,nullable=false)
	public String getGunit() {
		return gunit;
	}
	public void setGunit(String gunit) {
		this.gunit = gunit;
	}
	@Column(name="gpin",nullable=false)
	public double getGpin() {
		return gpin;
	}
	public void setGpin(double gpin) {
		this.gpin = gpin;
	}
	@Column(name="gpout",nullable=false)
	public double getGpout() {
		return gpout;
	}
	public void setGpout(double gpout) {
		this.gpout = gpout;
	}
	@Column(name="gamount",nullable=false)
	public int getGamount() {
		return gamount;
	}
	public void setGamount(int gamount) {
		this.gamount = gamount;
	}
	public String toString(){
		return this.gname;
	}	
}
