/*
 * �ͻ�������
 */
package com.orion;

public class ConsumerInfo {
	private String cid;//�ͻ�id
	private String cname;//�ͻ�����
	private String clinkman;//��ϵ��
	private String caddress;//��˾��ַ
	private String ctel;//��˾�绰
	private String cemail;//��˾��email
	private String cremark;//��ע
	
	public ConsumerInfo(){}
	public ConsumerInfo(String cid,String cname,String clinkman,
		String caddress,String ctel,String cemail,String cremark){
		this.cid = cid;
		this.cname = cname;
		this.clinkman = clinkman;
		this.caddress = caddress;
		this.ctel = ctel;
		this.cemail = cemail;
		this.cremark = cremark;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getClinkman() {
		return clinkman;
	}
	public void setClinkman(String clinkman) {
		this.clinkman = clinkman;
	}
	public String getCaddress() {
		return caddress;
	}
	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}
	public String getCtel() {
		return ctel;
	}
	public void setCtel(String ctel) {
		this.ctel = ctel;
	}
	public String getCemail() {
		return cemail;
	}
	public void setCemail(String cemail) {
		this.cemail = cemail;
	}
	public String getCremark() {
		return cremark;
	}
	public void setCremark(String cremark) {
		this.cremark = cremark;
	}
}
