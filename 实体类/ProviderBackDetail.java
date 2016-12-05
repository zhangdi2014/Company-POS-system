package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class ProviderBackDetail {
	private String pbdid;
	private String pbid;
	private String gid;
	private int pbdamount;
	private double pbdprice;
	private double pbdtotalprice;
	public ProviderBackDetail(){}
	public ProviderBackDetail(String pbdid,String pbid,String gid,int pbdamount,double pbdprice,double pbdtotalprice){
		this.pbdid = pbdid;
		this.pbid = pbid;
		this.gid = gid;
		this.pbdamount = pbdamount;
		this.pbdprice = pbdprice;
		this.pbdtotalprice = pbdtotalprice;
	}
	@Id
<<<<<<< HEAD:Orion/java-src/com/entity/ProviderBackDetail.java
//	@GeneratedValue(strategy = GenerationType.AUTO)
=======
	//@GeneratedValue(strategy = GenerationType.AUTO)
	@GeneratedValue(generator="system_uuid")
    @GenericGenerator(name="system_uuid",strategy="uuid")
>>>>>>> 10b44bf4fb6e3e9a1e4f1bd260ff99fd5357a3a3:实体类/ProviderBackDetail.java
    @Column(name = "pbdid") 
	public String getPbdid() {
		return pbdid;
	}
	public void setPbdid(String pbdid) {
		this.pbdid = pbdid;
	}
	@Column(name="pbid",length=20,nullable=false)
	public String getPbid() {
		return pbid;
	}
	public void setPbid(String pbid) {
		this.pbid = pbid;
	}
	@Column(name="gid",length=20,nullable=false)
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	@Column(name="pbdamount",nullable=false)
	public int getPbdamount() {
		return pbdamount;
	}
	public void setPbdamount(int pbdamount) {
		this.pbdamount = pbdamount;
	}
	@Column(name="pbdprice",nullable=false)
	public double getPbdprice() {
		return pbdprice;
	}
	public void setPbdprice(double pbdprice) {
		this.pbdprice = pbdprice;
	}
	@Column(name="pbdtotalprice",nullable=false)
	public double getPbdtotalprice() {
		return pbdtotalprice;
	}
	public void setPbdtotalprice(double pbdtotalprice) {
		this.pbdtotalprice = pbdtotalprice;
	}
}
