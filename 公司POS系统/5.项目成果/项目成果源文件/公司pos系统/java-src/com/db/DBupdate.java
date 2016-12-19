package com.db;

import java.util.*;
import org.springframework.orm.hibernate3.*;

import com.entity.AdminInfo;
import com.entity.ConsumerBack;
import com.entity.ConsumerBackDetail;
import com.entity.ConsumerInfo;
import com.entity.GoodsClassInfo;
import com.entity.GoodsInfo;
import com.entity.ProviderBack;
import com.entity.ProviderBackDetail;
import com.entity.ProviderInfo;
import com.entity.SellDetail;
import com.entity.SellInfo;
import com.entity.StockDetail;
import com.entity.StockInfo;

import org.hibernate.*;

public class DBupdate{	
	private SessionFactory sf;
	private DButil db;
	public SessionFactory getSf(){
		return this.sf;
	}
	public void setSf(SessionFactory sf){
		this.sf = sf;
	}
	public DButil getDb(){
		return this.db;
	}
	public void setDb(DButil db){
		this.db = db;
	}
	public void updateTable(String tablename,Object obj,String id){
		Session sess = sf.openSession();						//�����Ự
		Transaction t = sess.beginTransaction();				//��ʼһ������
		if(tablename.equals("GoodsInfo")){						//������ΪGoodsInfoʱ
			GoodsInfo gi = (GoodsInfo)sess.get(GoodsInfo.class,id);
			gi.setGname(((GoodsInfo)obj).getGname());			//�޸���Ʒ����
			gi.setGcid(((GoodsInfo)obj).getGcid());				//�޸���Ʒ����
			gi.setGunit(((GoodsInfo)obj).getGunit());			//�޸���Ʒ��λ
			gi.setGpin(((GoodsInfo)obj).getGpin());				//�޸���Ʒ����
			gi.setGpout(((GoodsInfo)obj).getGpout());			//�޸���Ʒ�ۼ�
			gi.setGamount(((GoodsInfo)obj).getGamount());		//�޸���Ʒ����
			sess.save(gi);										//�������
		}
		else if(tablename.equals("GoodsClassInfo")){			//���޸�����ʱ
			GoodsClassInfo gci = (GoodsClassInfo)sess.get(GoodsClassInfo.class,id);
			gci.setGcname(((GoodsClassInfo)obj).getGcname());	//�޸�����
			sess.save(gci);										//�������
		}
		else if(tablename.equals("ConsumerInfo")){				//���޸Ŀͻ�����ʱ
			ConsumerInfo ci = (ConsumerInfo)sess.get(ConsumerInfo.class,id);
			ci.setCname(((ConsumerInfo)obj).getCname());		//�޸Ŀͻ���
			ci.setClinkman(((ConsumerInfo)obj).getClinkman());	//�޸���ϵ��
			ci.setCaddress(((ConsumerInfo)obj).getCaddress());	//�޸Ĺ�˾��ַ
			ci.setCtel(((ConsumerInfo)obj).getCtel());			//�޸ĵ绰
			ci.setCemail(((ConsumerInfo)obj).getCemail());		//�޸�E-mail
			ci.setCremark(((ConsumerInfo)obj).getCremark());	//�޸ı�ע
			sess.save(ci);
		}
		else if(tablename.equals("ProviderInfo")){				//���޸Ĺ�Ӧ�̶���ʱ
			ProviderInfo pi = (ProviderInfo)sess.get(ProviderInfo.class,id);
			pi.setPname(((ProviderInfo)obj).getPname());		//�޸Ĺ�Ӧ������
			pi.setPlinkman(((ProviderInfo)obj).getPlinkman());	//�޸���ϵ��
			pi.setPaddress(((ProviderInfo)obj).getPaddress());	//�޸Ĺ�˾��ַ
			pi.setPtel(((ProviderInfo)obj).getPtel());			//�޸ĵ绰
			pi.setPemail(((ProviderInfo)obj).getPemail());		//�޸�E-mail
			pi.setPremark(((ProviderInfo)obj).getPremark());	//�޸ı�ע
			sess.save(pi);										//�������
		}
		else if(tablename.equals("StockInfo")){					//���޸Ĳɹ�����ʱ
			StockInfo si = (StockInfo)sess.get(StockInfo.class,id);
			si.setPid(((StockInfo)obj).getPid());				//�޸Ĺ�Ӧ��ID
//			si.setSdate(((StockInfo)obj).getSdate());			//�޸�����
			si.setSbuyer(((StockInfo)obj).getSbuyer());			//�޸Ĳɹ���
			sess.save(si);										//�������
		}
		else if(tablename.equals("StockDetail")){								//���޸Ĳɹ���ϸʱ
			StockDetail sd = (StockDetail)sess.get(StockDetail.class,id);		//�õ�����
			StockDetail temp = (StockDetail)obj;								//ǿ������ת��
			GoodsInfo gi = (GoodsInfo)sess.get(GoodsInfo.class,sd.getGid());	//�õ���Ʒ����
			gi.setGamount(gi.getGamount()-sd.getSdamount()+temp.getSdamount());	//�޸���Ʒ����
			sess.save(gi);														//������Ʒ
			sd.setSdamount(temp.getSdamount());									//�޸���ϸ����
			sd.setSdtotalprice(sd.getSdamount()*sd.getSdprice());
			sess.save(sd);														//������ϸ����
			t.commit();
			db.updateTotalprice("StockInfo",sd.getSid());
			t = sess.beginTransaction();
		}
		else if(tablename.equals("SellInfo")){
			SellInfo ei = (SellInfo)sess.get(SellInfo.class,id);
			ei.setCid(((SellInfo)obj).getCid());					//�޸Ŀͻ�ID
			ei.setEdate(((SellInfo)obj).getEdate());				//�޸�����
			ei.setEseller(((SellInfo)obj).getEseller());			//�޸Ĳɹ���
			sess.save(ei);											//�������
		}
		else if(tablename.equals("SellDetail")){								//���޸�������ϸʱ
			SellDetail ed = (SellDetail)sess.get(SellDetail.class,id);			//�õ���ϸ����
			SellDetail temp = (SellDetail)obj;									//ǿ������ת��
			GoodsInfo gi = (GoodsInfo)sess.get(GoodsInfo.class,ed.getGid());	//�õ���Ʒ����
			gi.setGamount(gi.getGamount()+ed.getEdamount()-temp.getEdamount());	//�޸���Ʒ����
			sess.save(gi);														//������Ʒ����
			ed.setEdamount(temp.getEdamount());									//�޸���ϸ����
			ed.setEdtotalprice(ed.getEdamount()*ed.getEdprice());
			sess.save(ed);														//������ϸ����
			t.commit();
			db.updateTotalprice("SellInfo",ed.getEid());
			t = sess.beginTransaction();
		}
		else if(tablename.equals("AdminInfo")){
			AdminInfo ai = (AdminInfo)sess.get(AdminInfo.class,id);
			AdminInfo temp = (AdminInfo)obj;
			ai.setApwd(temp.getApwd());
			sess.save(ai);
		}
		else if(tablename.equals("ConsumerBackDetail")){						//�޸������˻���ϸʱ
			ConsumerBackDetail cbd = (ConsumerBackDetail)sess.get(ConsumerBackDetail.class,id);
			ConsumerBackDetail temp = (ConsumerBackDetail)obj;							//ǿ������ת��
			GoodsInfo gi = (GoodsInfo)sess.get(GoodsInfo.class,cbd.getGid());			//�õ�������Ʒ����
			gi.setGamount(gi.getGamount()-cbd.getCbdamount()+temp.getCbdamount());		//�޸���Ʒ����
			sess.save(gi);																//������Ʒ����
			ConsumerBack cb = (ConsumerBack)sess.get(ConsumerBack.class,cbd.getCbid());	//�õ��˻�����
			String hql = "from SellDetail as ed where ed.eid='"
							+cb.getEid()+"' and ed.gid='"+cbd.getGid()+"'";				//�������۶����hql
			SellDetail sd = ((List<SellDetail>)db.getInfo(hql)).get(0);					//�õ����۶���
			SellDetail sdtemp = (SellDetail)sess.get(SellDetail.class,sd.getEdid());	//��get�õ����۶���
			sdtemp.setEdamount(sdtemp.getEdamount()+cbd.getCbdamount()-temp.getCbdamount());//�޸���������
			sdtemp.setEdtotalprice(sdtemp.getEdamount()*sdtemp.getEdprice());			//�޸������ܼ�
			sess.save(sdtemp);															//�������۶���
			t.commit();
			db.updateTotalprice("SellInfo",sdtemp.getEid());
			t = sess.beginTransaction();
			cbd.setCbdamount(temp.getCbdamount());										//�޸���ϸ����
			cbd.setCbdtotalprice(cbd.getCbdamount()*cbd.getCbdprice());					//�޸���ϸ�ܼ�
			sess.save(cbd);																//������ϸ����
		}
		else if(tablename.equals("ProviderBackDetail")){
			ProviderBackDetail pbd = (ProviderBackDetail)sess.get(ProviderBackDetail.class,id);
			ProviderBackDetail temp = (ProviderBackDetail)obj;							//ǿ������ת��
			GoodsInfo gi = (GoodsInfo)sess.get(GoodsInfo.class,pbd.getGid());			//�õ�������Ʒ����
			gi.setGamount(gi.getGamount()+pbd.getPbdamount()-temp.getPbdamount());		//�޸���Ʒ����
			sess.save(gi);																//������Ʒ����
			ProviderBack pb = (ProviderBack)sess.get(ProviderBack.class,pbd.getPbid());	//�õ��˻�����
			String hql = "from StockDetail as sd where sd.sid='"
							+pb.getPid()+"' and sd.gid='"+pbd.getGid()+"'";				//�����ɹ������hql
			StockDetail sd = ((List<StockDetail>)db.getInfo(hql)).get(0);					//�õ��ɹ�����
			StockDetail sdtemp = (StockDetail)sess.get(StockDetail.class,sd.getSdid());	//��get�õ��ɹ�����
			sdtemp.setSdamount(sdtemp.getSdamount()+pbd.getPbdamount()-temp.getPbdamount());//�޸Ĳɹ�����
			sdtemp.setSdtotalprice(sdtemp.getSdamount()*sdtemp.getSdprice());			//�޸Ĳɹ��ܼ�
			sess.save(sdtemp);															//����ɹ�����
			t.commit();
			db.updateTotalprice("StockInfo",sdtemp.getSid());								//���¸����ܼ�
			t = sess.beginTransaction();
			pbd.setPbdamount(temp.getPbdamount());										//�޸���ϸ����
			pbd.setPbdtotalprice(pbd.getPbdamount()*pbd.getPbdprice());					//�޸���ϸ�ܼ�
			sess.save(pbd);																//������ϸ����
		}
		t.commit();													//�ύ����
		sess.close();												//�رջỰ
	}
}