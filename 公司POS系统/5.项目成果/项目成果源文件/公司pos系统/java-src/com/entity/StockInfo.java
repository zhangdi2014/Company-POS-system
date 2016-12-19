package com.entity;

import java.util.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity
public class StockInfo {
	private String sid;
	private String pid;
	private Date sdate;
	private double stotalprice;
	private String sbuyer;
	public StockInfo(){}
	public StockInfo(String sid,String pid,Date sdate,double stotalprice,String sbuyer){
		this.sid = sid;
		this.pid = pid;
		this.sdate = sdate;
		this.stotalprice = stotalprice;
		this.sbuyer = sbuyer;
	}
	@Id
    @Column(name = "sid") 
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	@Column(name="pid",length=20,nullable=false)
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	@Temporal(TemporalType.DATE)
	@Column(name="sdate")
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	@Column(name="stotalprice",nullable=false)
	public double getStotalprice() {
		return stotalprice;
	}
	public void setStotalprice(double stotalprice) {
		this.stotalprice = stotalprice;
	}
	@Column(name="sbuyer",length=50,nullable=false)
	public String getSbuyer() {
		return sbuyer;
	}
	public void setSbuyer(String sbuyer) {
		this.sbuyer = sbuyer;
	}
}
