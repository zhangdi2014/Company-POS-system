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

public class DBdelete{	
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
	public void deleteTable(String tablename,String id){
		Session sess = sf.openSession();							//�����Ự
		Transaction t = sess.beginTransaction();					//��ʼһ������
		if(tablename.equals("GoodsInfo")){							//������ΪGoodsInfoʱ
			GoodsInfo gi = (GoodsInfo)sess.get(GoodsInfo.class,id);	//�õ�����
			if(gi!=null){
				sess.delete(gi);									//���ö���ɾ��
			}
		}
		else if(tablename.equals("GoodsClassInfo")){				//ɾ��������ʱ
			GoodsClassInfo gci = (GoodsClassInfo)sess.get(GoodsClassInfo.class,id);
			if(gci!=null){
				sess.delete(gci);									//ɾ��
			}
		}
		else if(tablename.equals("ConsumerInfo")){					//ɾ���ͻ�����ʱ
			ConsumerInfo ci = (ConsumerInfo)sess.get(ConsumerInfo.class,id);
			if(ci!=null){
				sess.delete(ci);									//ɾ������
			}
		}
		else if(tablename.equals("ProviderInfo")){					//ɾ����Ӧ�̶���ʱ
			ProviderInfo pi = (ProviderInfo)sess.get(ProviderInfo.class,id);
			if(pi!=null){											//������Ϊ��
				sess.delete(pi);									//ɾ������
			}
		}
		else if(tablename.equals("StockDetail")){
			StockDetail sd = (StockDetail)sess.get(StockDetail.class,id);		//�õ�StockDetail����
			if(sd!=null){
				GoodsInfo gi = (GoodsInfo)sess.get(GoodsInfo.class,sd.getGid());//�õ�GoodsInfo����
				gi.setGamount(gi.getGamount()-sd.getSdamount());	//�θ�����	
				sess.save(gi);										//�������		
				sess.delete(sd);									//ɾ������		
				t.commit();
				db.updateTotalprice("StockInfo",sd.getSid());			//���¸����ܼ�
				t = sess.beginTransaction();
			}
		}
		else if(tablename.equals("StockInfo")){						//��ɾ������Ϊstockinfoʱ
			StockInfo si = (StockInfo)sess.get(StockInfo.class,id);	//�õ�����
			if(si!=null){											//������Ϊ��ʱ
				String hql = "from StockDetail as sd where sd.sid='"+id+"'";		//�õ���ϸ�б��hql
				List<StockDetail> list = (List<StockDetail>)db.getInfo(hql);			//�õ��б�
				for(StockDetail sd:list){											//ѭ��
					GoodsInfo gi = (GoodsInfo)sess.get(GoodsInfo.class,sd.getGid());//�õ�GoodsInfo����
					gi.setGamount(gi.getGamount()-sd.getSdamount());				//�θ�����	
					sess.save(gi);													//�������
				}				
				sess.delete(si);													//ɾ������
			}
		}
		else if(tablename.equals("SellDetail")){									//��ɾ��������ϸ����ʱ
			SellDetail ed = (SellDetail)sess.get(SellDetail.class,id);				//�õ���ϸ����
			if(ed!=null){															//������Ϊ��ʱ
				GoodsInfo gi = (GoodsInfo)sess.get(GoodsInfo.class,ed.getGid());	//�õ���Ʒ����
				gi.setGamount(gi.getGamount()+ed.getEdamount());					//�޸���Ʒ����
				sess.save(gi);														//������Ʒ����
				sess.delete(ed);													//ɾ����ϸ
				t.commit();
				db.updateTotalprice("SellInfo",ed.getEid());							//���¸����ܼ�
				t = sess.beginTransaction();
			}
		}
		else if(tablename.equals("SellInfo")){
			SellInfo ei = (SellInfo)sess.get(SellInfo.class,id);					//�õ�Ҫɾ���Ķ���
			if(ei!=null){															//���������
				String hql = "from SellDetail as ed where ed.eid='"+id+"'";			//������Ӧ����ϸ
				List<SellDetail> list = (List<SellDetail>)db.getInfo(hql);				//�õ���ϸ����
				for(SellDetail ed:list){
					GoodsInfo gi = (GoodsInfo)sess.get(GoodsInfo.class,ed.getGid());//�õ�GoodsInfo����
					gi.setGamount(gi.getGamount()+ed.getEdamount());				//�θ�����	
					sess.save(gi);													//�������	
				}
				sess.delete(ei);													//ɾ������
			}			
		}
		else if(tablename.equals("AdminInfo")){										//ɾ������Աʱ
			AdminInfo ai = (AdminInfo)sess.get(AdminInfo.class,id);					//�õ�����Ա����
			if(ai!=null){															//������Ϊ��
				sess.delete(ai);													//ɾ������
			}
		}
		else if(tablename.equals("ConsumerBackDetail")){										//ɾ���ͻ��˻���ϸ
			ConsumerBackDetail cbd = (ConsumerBackDetail)sess.get(ConsumerBackDetail.class,id);	//�õ�����
			if(cbd!=null){																		//������Ϊ��
				ConsumerBack cb = (ConsumerBack)sess.get(ConsumerBack.class,cbd.getCbid());		//�õ��ͻ�����
				String hql = "from SellDetail as ed where ed.eid='"
							+cb.getEid()+"' and ed.gid='"+cbd.getGid()+"'";
				SellDetail temp = ((List<SellDetail>)db.getInfo(hql)).get(0);						//�õ���Ӧ��������ϸ����
				SellDetail sd = (SellDetail)sess.get(SellDetail.class,temp.getEdid());			//�õ���ϸ����
				sd.setEdamount(sd.getEdamount()+cbd.getCbdamount());							//�޸���������
				sd.setEdtotalprice(sd.getEdamount()*sd.getEdprice());							//�޸������ܼ۸�
				sess.save(sd);																	//�������
				GoodsInfo gi = (GoodsInfo)sess.get(GoodsInfo.class,cbd.getGid());				//�õ���Ʒ����
				gi.setGamount(gi.getGamount()-cbd.getCbdamount());								//�޸���Ʒ����
				sess.save(gi);																	//������Ʒ����
				sess.delete(cbd);																//ɾ����ϸ����
				t.commit();
				db.updateTotalprice("SellInfo",sd.getEid());										//���¸����ܼ۸�
				t = sess.beginTransaction();
			}			
		}
		else if(tablename.equals("ProviderBackDetail")){
			ProviderBackDetail pbd = (ProviderBackDetail)sess.get(ProviderBackDetail.class,id);	//�õ�����
			if(pbd!=null){																		//������Ϊ��
				ProviderBack pb = (ProviderBack)sess.get(ProviderBack.class,pbd.getPbid());		//�õ���Ӧ�̶���
				String hql = "from StockDetail as sd where sd.sid='"
							+pb.getSid()+"' and sd.gid='"+pbd.getGid()+"'";
				StockDetail temp = ((List<StockDetail>)db.getInfo(hql)).get(0);					//�õ���Ӧ�Ĳɹ���ϸ����
				StockDetail sd = (StockDetail)sess.get(StockDetail.class,temp.getSdid());		//�õ���ϸ����
				sd.setSdamount(sd.getSdamount()+pbd.getPbdamount());							//�޸Ĳɹ�����
				sd.setSdtotalprice(sd.getSdamount()*sd.getSdprice());							//�޸Ĳɹ��ܼ۸�
				sess.save(sd);																	//�������
				GoodsInfo gi = (GoodsInfo)sess.get(GoodsInfo.class,pbd.getGid());				//�õ���Ʒ����
				gi.setGamount(gi.getGamount()+pbd.getPbdamount());								//�޸���Ʒ����
				sess.save(gi);																	//������Ʒ����
				sess.delete(pbd);																//ɾ����ϸ����
				t.commit();
				db.updateTotalprice("StockInfo",sd.getSid());										//���¸����ܼ۸�
				t = sess.beginTransaction();
			}
		}
		else if(tablename.equals("ProviderBack")){
			ProviderBack pb = (ProviderBack)sess.get(ProviderBack.class,id);					//�õ�Ҫɾ���Ķ���
			if(pb!=null){
				String pbdtemp = "from ProviderBackDetail as pbd where pbd.pbid='"+pb.getPbid()+"'";
				List<ProviderBackDetail> list = (List<ProviderBackDetail>)db.getInfo(pbdtemp);
				for(ProviderBackDetail pbd:list){
					String hql = "from StockDetail as sd where sd.sid='"
								+pb.getSid()+"' and sd.gid='"+pbd.getGid()+"'";
					StockDetail temp = ((List<StockDetail>)db.getInfo(hql)).get(0);					//�õ���Ӧ�Ĳɹ���ϸ����
					StockDetail sd = (StockDetail)sess.get(StockDetail.class,temp.getSdid());		//�õ���ϸ����
					sd.setSdamount(sd.getSdamount()+pbd.getPbdamount());							//�޸Ĳɹ�����
					sd.setSdtotalprice(sd.getSdamount()*sd.getSdprice());							//�޸Ĳɹ��ܼ۸�
					sess.save(sd);																	//�������
					GoodsInfo gi = (GoodsInfo)sess.get(GoodsInfo.class,pbd.getGid());				//�õ���Ʒ����
					gi.setGamount(gi.getGamount()+pbd.getPbdamount());								//�޸���Ʒ����
					sess.save(gi);																	//������Ʒ����
					sess.delete(pbd);																//ɾ����ϸ����
					t.commit();
					db.updateTotalprice("StockInfo",sd.getSid());										//���¸����ܼ۸�
					t = sess.beginTransaction();
				}
				sess.delete(pb);
			}
		}
		else if(tablename.equals("ConsumerBack")){
			ConsumerBack cb = (ConsumerBack)sess.get(ConsumerBack.class,id);					//�õ�Ҫɾ���Ķ���	
			if(cb!=null){
				String cbdtemp = "from ConsumerBackDetail as cbd where cbd.cbid='"+cb.getCbid()+"'";
				List<ConsumerBackDetail> list = (List<ConsumerBackDetail>)db.getInfo(cbdtemp);
				for(ConsumerBackDetail cbd:list){					
					String hql = "from SellDetail as ed where ed.eid='"
								+cb.getEid()+"' and ed.gid='"+cbd.getGid()+"'";
					SellDetail temp = ((List<SellDetail>)db.getInfo(hql)).get(0);						//�õ���Ӧ��������ϸ����
					SellDetail sd = (SellDetail)sess.get(SellDetail.class,temp.getEdid());			//�õ���ϸ����
					sd.setEdamount(sd.getEdamount()+cbd.getCbdamount());							//�޸���������
					sd.setEdtotalprice(sd.getEdamount()*sd.getEdprice());							//�޸������ܼ۸�
					sess.save(sd);																	//�������
					GoodsInfo gi = (GoodsInfo)sess.get(GoodsInfo.class,cbd.getGid());				//�õ���Ʒ����
					gi.setGamount(gi.getGamount()-cbd.getCbdamount());								//�޸���Ʒ����
					sess.save(gi);																	//������Ʒ����
					sess.delete(cbd);																//ɾ����ϸ����
					t.commit();
					db.updateTotalprice("SellInfo",sd.getEid());
					t = sess.beginTransaction();
				}		
				sess.delete(cb);
			}		
		}
		t.commit();										//�ύ����
		sess.close();									//�رջỰ
	}
}