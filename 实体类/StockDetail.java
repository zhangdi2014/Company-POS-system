package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class StockDetail {
	private String sdid;
	private String sid;
	private String gid;
	private int sdamount;
	private double sdprice;
	private double sdtotalprice;
	public StockDetail(){}
	public StockDetail(String sdid,String sid,String gid,int sdamount,double sdprice,double sdtotalprice){
		this.sdid = sdid;
		this.sid = sid;
		this.gid = gid;
		this.sdamount = sdamount;
		this.sdprice = sdprice;
		this.sdtotalprice = sdtotalprice;
	}
	@Id
	//@GeneratedValue(strategy = GenerationType.AUTO)
	@GeneratedValue(generator="system_uuid")
    @GenericGenerator(name="system_uuid",strategy="uuid")
    @Column(name = "sdid") 
	public String getSdid() {
		return sdid;
	}
	public void setSdid(String sdid) {
		this.sdid = sdid;
	}
	@Column(name="sid",length=20,nullable=false)
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	@Column(name="gid",length=20,nullable=false)
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	@Column(name="sdamount",nullable=false)
	public int getSdamount() {
		return sdamount;
	}
	public void setSdamount(int sdamount) {
		this.sdamount = sdamount;
	}
	@Column(name="sdprice",nullable=false)
	public double getSdprice() {
		return sdprice;
	}
	public void setSdprice(double sdprice) {
		this.sdprice = sdprice;
	}
	@Column(name="sdtptalprice",nullable=false)
	public double getSdtotalprice() {
		return sdtotalprice;
	}
	public void setSdtotalprice(double sdtotalprice) {
		this.sdtotalprice = sdtotalprice;
	}
}
