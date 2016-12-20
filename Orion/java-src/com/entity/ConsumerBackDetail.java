package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity

public class ConsumerBackDetail {
	private String cbdid;
	private String cbid;
	private String gid;
	private int cbdamount;
	private double cbdprice;
	private double cbdtotalprice;
	public ConsumerBackDetail(){}
	public ConsumerBackDetail(String cbdid,String cbid,String gid,int cbdamount,double cbdprice,double cbdtotalprice){
		this.cbdid = cbdid;
		this.cbid = cbid;
		this.gid = gid;
		this.cbdamount = cbdamount;
		this.cbdprice = cbdprice;
		this.cbdtotalprice = cbdtotalprice;
	}
	@Id
    @Column(name = "cbid") 
	public String getCbdid() {
		return cbdid;
	}
	public void setCbdid(String cbdid) {
		this.cbdid = cbdid;
	}
	@Column(name="cbid",insertable=false,updatable=false,length=20,nullable=false)
	public String getCbid() {
		return cbid;
	}
	public void setCbid(String cbid) {
		this.cbid = cbid;
	}
	@Column(name="gid",length=20,nullable=false)
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	@Column(name="cbdamount",nullable=false)
	public int getCbdamount() {
		return cbdamount;
	}
	public void setCbdamount(int cbdamount) {
		this.cbdamount = cbdamount;
	}
	@Column(name="cbdprice",nullable=false)
	public double getCbdprice() {
		return cbdprice;
	}
	public void setCbdprice(double cbdprice) {
		this.cbdprice = cbdprice;
	}
	@Column(name="cbdtotalprice",nullable=false)
	public double getCbdtotalprice() {
		return cbdtotalprice;
	}
	public void setCbdtotalprice(double cbdtotalprice) {
		this.cbdtotalprice = cbdtotalprice;
	}
}
