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
public class SellInfo {
	private String eid;
	private Date edate;
	private String cid;
	private double etotalprice;
	private String eseller;
	public SellInfo(){}
	public SellInfo(String eid,String cid,Date edate,double etotalprice,String eseller){
		this.eid = eid;
		this.edate = edate;
		this.cid = cid;
		this.etotalprice = etotalprice;
		this.eseller = eseller;
	}
	@Id
//	@GeneratedValue(strategy = GenerationType.AUTO)
	@GeneratedValue(generator="system_uuid")
    @GenericGenerator(name="system_uuid",strategy="uuid")
    @Column(name = "eid") 
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
	}
	@Column(name="edate", insertable=false,updatable=false,nullable=false)
	public Date getEdate() {
		return edate;
	}
	public void setEdate(Date edate) {
		this.edate = edate;
	}
	@Column(name="cid",nullable=false)
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	@Column(name="etotalprice",nullable=false)
	public double getEtotalprice() {
		return etotalprice;
	}
	public void setEtotalprice(double etotalprice) {
		this.etotalprice = etotalprice;
	}
	@Column(name="edate",length=50,nullable=false)
	public String getEseller() {
		return eseller;
	}
	public void setEseller(String eseller) {
		this.eseller = eseller;
	}
}
