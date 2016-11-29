/*
 * 商品类别类
 */
package com.orion;

public class GoodsClassInfo {
	private String gcid;
	private String gcname;
	
	public GoodsClassInfo(){}
	public GoodsClassInfo(String gcid,String gcname){
		this.gcid = gcid;
		this.gcname = gcname;
	}
	public String getGcid() {
		return gcid;
	}
	public void setGcid(String gcid) {
		this.gcid = gcid;
	}
	public String getGcname() {
		return gcname;
	}
	public void setGcname(String gcname) {
		this.gcname = gcname;
	}
}
