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

public class DBinsert{	
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
	public void insertTable(String tablename,Object obj){		//�����������
		Session sess = sf.openSession();						//�����Ự
		Transaction t = sess.beginTransaction();				//����һ������
		if(tablename.equals("GoodsInfo")){						//��Ϊ��Ʒʱ
			GoodsInfo gi = (GoodsInfo)obj;						//ǿ������ת��
			sess.save(gi);										//�������
		}
		else if(tablename.equals("GoodsClassInfo")){			//��Ϊ��Ʒ���ʱ
			GoodsClassInfo gci = (GoodsClassInfo)obj;			//ǿ������ת��
			sess.save(gci);										//�������
		}
		else if(tablename.equals("ConsumerInfo")){				//��Ϊ�ͻ�ʱ
			ConsumerInfo ci = (ConsumerInfo)obj;				//ǿ������ת��
			sess.save(ci);										//�������
		}
		else if(tablename.equals("ProviderInfo")){				//��Ϊ��Ӧ��ʱ
			ProviderInfo pi = (ProviderInfo)obj;				//ǿ������ת��
			sess.save(pi);										//�������
		}
		else if(tablename.equals("StockInfo")){					//������ɹ�����ʱ
			StockInfo si = (StockInfo)obj;						//ǿ������ת��
			sess.save(si);										//�������
		}
		else if(tablename.equals("StockDetail")){				//���������Ϊ�ɹ���ϸʱ
			StockDetail sd = (StockDetail)obj;					//ǿ������ת��
			String hql = "from StockDetail as sd where sd.gid='"
						+sd.getGid()+"' and sd.sid='"+sd.getSid()+"'";
			List<StockDetail> list = (List<StockDetail>)db.getInfo(hql);
			GoodsInfo gi = (GoodsInfo)sess.get(GoodsInfo.class,sd.getGid());
			gi.setGamount(gi.getGamount()+sd.getSdamount());	//������Ʒ����
			sess.save(gi);										//������Ʒ����
			if(!list.isEmpty()){
				StockDetail sdtemp = (StockDetail)sess.get(StockDetail.class,list.get(0).getSdid());
				sdtemp.setSdamount(sdtemp.getSdamount()+sd.getSdamount());
				sdtemp.setSdtotalprice(sdtemp.getSdamount()*sdtemp.getSdprice());
				sess.save(sdtemp);
			}
			else{
				sess.save(sd);										//ɾ����ϸ����				
			}
			t.commit();
			db.updateTotalprice("StockInfo",sd.getSid());
			t = sess.beginTransaction();			
		}
		else if(tablename.equals("SellInfo")){					//���������۶���ʱ
			SellInfo ei = (SellInfo)obj;						//ǿ������ת��
			sess.save(ei);										//�������
		}
		else if(tablename.equals("SellDetail")){				//������������ϸʱ
			SellDetail ed = (SellDetail)obj;					//ǿ������ת��
			String hql = "from SellDetail as sd where sd.gid='"
					+ed.getGid()+"' and sd.eid='"+ed.getEid()+"'";
			List<SellDetail> list = (List<SellDetail>)db.getInfo(hql);
			GoodsInfo gi = (GoodsInfo)sess.get(GoodsInfo.class,ed.getGid());
			gi.setGamount(gi.getGamount()-ed.getEdamount());	//��������
			sess.save(gi);	
			if(!list.isEmpty()){				
				SellDetail sdtemp = (SellDetail)sess.get(SellDetail.class,list.get(0).getEdid());
				sdtemp.setEdamount(sdtemp.getEdamount()+ed.getEdamount());
				sdtemp.setEdtotalprice(sdtemp.getEdamount()*sdtemp.getEdprice());
				sess.save(sdtemp);
			}
			else{
				sess.save(ed);										//�������
			}
			t.commit();
			db.updateTotalprice("SellInfo",ed.getEid());
			t = sess.beginTransaction();
		}
		else if(tablename.equals("AdminInfo")){					//��ӹ���Ա����ʱ
			AdminInfo ai = (AdminInfo)obj;						//ǿ������ת��
			sess.save(ai);										//�������
		}
		else if(tablename.equals("ConsumerBack")){				//��ӿͻ��˻�
			ConsumerBack cb = (ConsumerBack)obj;				//ǿ������ת��
			sess.save(cb);										//�������
		}
		else if(tablename.equals("ProviderBack")){				//��Ӳɹ��˻�
			ProviderBack pb = (ProviderBack)obj;				//ǿ������ת��
			sess.save(pb);										//�������
		}
		else if(tablename.equals("ConsumerBackDetail")){
			ConsumerBackDetail cbd = (ConsumerBackDetail)obj;			
			ConsumerBack cb = (ConsumerBack)sess.get(ConsumerBack.class,cbd.getCbid());			
			String temp = "from SellDetail as ed where ed.eid='"
						+cb.getEid()+"' and ed.gid='"+cbd.getGid()+"'";
			SellDetail sd = ((List<SellDetail>)db.getInfo(temp)).get(0);		
			String hql = "from ConsumerBackDetail as cbd where cbd.gid='"
					+cbd.getGid()+"' and cbd.cbid='"+cbd.getCbid()+"'";
			List<ConsumerBackDetail> list = (List<ConsumerBackDetail>)db.getInfo(hql);		
			GoodsInfo gi = (GoodsInfo)sess.get(GoodsInfo.class,cbd.getGid());
			gi.setGamount(gi.getGamount()+cbd.getCbdamount());
			sess.save(gi);				
			SellDetail sdtemp = (SellDetail)sess.get(SellDetail.class,sd.getEdid());
			sdtemp.setEdamount(sdtemp.getEdamount()-cbd.getCbdamount());
			sdtemp.setEdtotalprice(sdtemp.getEdamount()*sdtemp.getEdprice());
			sess.save(sdtemp);
			t.commit();
			db.updateTotalprice("SellInfo",sdtemp.getEid());			
			t = sess.beginTransaction();
			if(!list.isEmpty()){				
				ConsumerBackDetail cbdtemp = 
					(ConsumerBackDetail)sess.get(ConsumerBackDetail.class,list.get(0).getCbdid());
				cbdtemp.setCbdamount(cbdtemp.getCbdamount()+cbd.getCbdamount());
				cbdtemp.setCbdtotalprice(cbdtemp.getCbdamount()*cbdtemp.getCbdprice());			
				sess.save(cbdtemp);
			}
			else{				
				sess.save(cbd);			
			}			
		}
		else if(tablename.equals("ProviderBackDetail")){
			ProviderBackDetail pbd = (ProviderBackDetail)obj;
			ProviderBack pb = (ProviderBack)sess.get(ProviderBack.class,pbd.getPbid());
			String temp = "from StockDetail as sd where sd.sid='"
						+pb.getSid()+"' and sd.gid='"+pbd.getGid()+"'";
			StockDetail sd = ((List<StockDetail>)db.getInfo(temp)).get(0);
			String hql = "from ProviderBackDetail as pbd where pbd.gid='"
					+pbd.getGid()+"' and pbd.pbid='"+pbd.getPbid()+"'";
			List<ProviderBackDetail> list = (List<ProviderBackDetail>)db.getInfo(hql);	
			GoodsInfo gi = (GoodsInfo)sess.get(GoodsInfo.class,pbd.getGid());
			gi.setGamount(gi.getGamount()-pbd.getPbdamount());
			sess.save(gi);
			StockDetail sdtemp = (StockDetail)sess.get(StockDetail.class,sd.getSdid());
			sdtemp.setSdamount(sdtemp.getSdamount()-pbd.getPbdamount());
			sdtemp.setSdtotalprice(sdtemp.getSdamount()*sdtemp.getSdprice());
			sess.save(sdtemp);
			t.commit();
			db.updateTotalprice("StockInfo",sdtemp.getSid());
			t = sess.beginTransaction();
			if(!list.isEmpty()){
				ProviderBackDetail pbdtemp = 
					(ProviderBackDetail)sess.get(ProviderBackDetail.class,list.get(0).getPbdid());
				pbdtemp.setPbdamount(pbdtemp.getPbdamount()+pbd.getPbdamount());
				pbdtemp.setPbdtotalprice(pbdtemp.getPbdamount()*pbdtemp.getPbdprice());			
				sess.save(pbdtemp);		
			}
			else{
				sess.save(pbd);
			}
		}
		t.commit();												//�ύ����
		sess.close();											//�رջỰ
	}
}