package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
public class AdminInfo {
	private String aid;
	private String aname;
	private String apwd;
	private String alevel;
	public AdminInfo(){}
	public AdminInfo(String aid,String aname,String apwd,String alevel){
		this.aid = aid;
		this.aname = aname;
		this.apwd = apwd;
		this.alevel = alevel;
	}
	@Id              // 琛ㄧず涓婚敭

   // @GenericGenerator(name = "generator", strategy = "increment")   @GeneratedValue(generator = "generator")   // 鑷闀�
//	@GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "aid")                                 // 绫诲睘鎬у搴旂潃琛ㄥ瓧娈�
	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}
	@Column(name="Aname",length=50,nullable = false)    
	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}
	@Column(name="apwd",length=20,nullable = false)    
	public String getApwd() {
		return apwd;
	}

	public void setApwd(String apwd) {
		this.apwd = apwd;
	}
	@Column(name="alevel",length=20,nullable = false)    
	public String getAlevel() {
		return alevel;
	}
	public void setAlevel(String alevel) {
		this.alevel = alevel;
	}



	public String toString(){
		return this.aname+"/t"+this.apwd;
	}
}
