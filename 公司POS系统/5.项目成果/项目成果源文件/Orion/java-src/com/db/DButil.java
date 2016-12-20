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

public class DButil {
	private SessionFactory sf;
	public SessionFactory getSf(){
		return this.sf;
	}
	public void setSf(SessionFactory sf){
		this.sf = sf;
	}
	public String getId(String tablename,String columnname){
		Session sess = sf.openSession();						//�����Ự
		String hql = "select Max("+columnname+") from "+tablename;
		Query q = sess.createQuery(hql);						//���в�ѯ
		List<String> result = q.list();							//�õ�����б�
		if(result.get(0)==null){								//������û�м�¼��
			return "10001";
		}
		int id = Integer.parseInt(result.get(0));				//��idת��Ϊint��
		id++;													//��id�Լ�
		sess.close();
		return Integer.valueOf(id).toString();					//����id
	}
	public List<?> getInfo(String hql){
		Session sess = sf.openSession();						//�����Ự
		Query q = sess.createQuery(hql);						//ִ�в�ѯ
		List<?> list = q.list();								//�õ�����б�
		sess.close();
		return list;											//������б���
	}
	public List<?> getPageContent(String hql,int page,int span){//�õ�ĳҳ������
		List temp = new ArrayList();							//����list,�������ҳ������
		Session sess = sf.openSession();						//�����Ự
		Query q = sess.createQuery(hql);						//ִ�в�ѯ
		List list = q.list();									//�õ����
		int i = 0;												//��־λ,������¼����
		while((page-1)*span+i<list.size()&&i<span){							
			temp.add(list.get((page-1)*span+i));				//�������ӵ�temp��
			i++;												//��־λ�Լ�
		}
		sess.close();
		return temp;											//���������
	}
	public int getTotalPage(String hql,int span){				//�����õ���ҳ��
		Session sess = sf.openSession();						//�����Ự
		Query q = sess.createQuery(hql);						//ִ�в�ѯ
		List<Long> list = q.list();								//�õ�����б�
		int count = (list.get(0)).intValue();					//�õ��ܼ�¼����
		int page = (count%span==0)?(count/span):(count/span+1);	//�õ���ҳ��
		sess.close();
		return page;											//����ҳ������
	}
	public List<String> getGoodsClass(){
		Session sess = sf.openSession();						//�õ�session����
		String hql = "select gcname from GoodsClassInfo";		//�õ����е�������hql
		Query q = sess.createQuery(hql);						//ִ�в�ѯ
		List<String> name = q.list();							//�õ��б�
		sess.close();
		return name;											//���������
	}

	public Object getObject(String tablename,String id){
		Session sess = sf.openSession();						//�����Ự
		Object obj = null;										//��������
		if(tablename.equals("GoodsInfo")){						//���õ���Ʒ����ʱ
			obj = sess.get(GoodsInfo.class,id);					//�õ�����			
		}
		else if(tablename.equals("GoodsClassInfo")){			//���õ�������ʱ
			obj = sess.get(GoodsClassInfo.class,id);			//�õ�����
		}
		else if(tablename.equals("ConsumerInfo")){				//�õ��ͻ�����ʱ
			obj = sess.get(ConsumerInfo.class,id);				//�õ�����
		}
		else if(tablename.equals("ProviderInfo")){				//�õ���Ӧ�̶���ʱ
			obj = sess.get(ProviderInfo.class,id);				//�õ�����
		}
		else if(tablename.equals("StockInfo")){					//�õ��ɹ���Ϣʱ
			obj = sess.get(StockInfo.class,id);					//�õ�����
		}
		else if(tablename.equals("StockDetail")){				//���õ��ɹ���ϸʱ
			obj = sess.get(StockDetail.class,id);				//�õ�����
		}
		else if(tablename.equals("SellInfo")){					//���õ����۶���ʱ
			obj = sess.get(SellInfo.class,id);					//�õ�����
		}
		else if(tablename.equals("SellDetail")){				//���õ�������ϸ����ʱ
			obj = sess.get(SellDetail.class,id);				//�õ�����
		}
		else if(tablename.equals("AdminInfo")){
			obj = sess.get(AdminInfo.class,id);
		}
		else if(tablename.equals("ConsumerBack")){
			obj = sess.get(ConsumerBack.class,id);
		}
		else if(tablename.equals("ProviderBack")){
			obj = sess.get(ProviderBack.class,id);
		}
		else if(tablename.equals("ConsumerBackDetail")){
			obj = sess.get(ConsumerBackDetail.class,id);
		}
		else if(tablename.equals("ProviderBackDetail")){
			obj = sess.get(ProviderBackDetail.class,id);
		}
		sess.close();											//�رջỰ
		return obj;												//���ض���
	}

	public List<String> getProvider(){
		Session sess = sf.openSession();				//�����Ự
		String hql = "select pname from ProviderInfo";	//�õ����еĹ�Ӧ�̵�hql
		Query q = sess.createQuery(hql);				//ִ�в�ѯ
		List<String> name = q.list();					//�õ��б�
		sess.close();
		return name;									//���������
	}
	public List<String> getGoods(){
		Session sess = sf.openSession();				//�����Ự
		String hql = "select gname from GoodsInfo";		//�õ�������Ʒ���ֵ�hql
		Query q = sess.createQuery(hql);				//ִ������
		List<String> name  = q.list();					//�õ��б�
		sess.close();									//�رջỰ
		return name;									//����
	}
	public List<String> getConsumer(){
		Session sess = sf.openSession();				//�����Ự
		String hql = "select cname from ConsumerInfo";	//�õ������ͻ����ֵ�hql
		Query q = sess.createQuery(hql);				//ִ�в�ѯ
		List<String> name = q.list();					//�õ��б�
		sess.close();									//�رջỰ
		return name;									//����
	}
	public List<String> getAdmin(){
		Session sess = sf.openSession();				//�����Ự
		String hql = "select aname from AdminInfo";		//�õ���������Ա���ֵ�hql
		Query q = sess.createQuery(hql);				//ִ�в�ѯ
		List<String> name = q.list();					//�õ��б�
		sess.close();									//�رջỰ
		return name;									//����
	}
	public Date getDate(String now){
		String[] dd = now.split("-");					//��ʱ�ڷָ�
		int year = Integer.parseInt(dd[0])-1900;		//�õ����
		int month = Integer.parseInt(dd[1])-1;			//�õ��·�
		int day = Integer.parseInt(dd[2]);				//�õ�����
		return new Date(year,month,day);				//�������ڶ���
	}
	public void updateTotalprice(String name,String id){
		Session sess = sf.openSession();
		Transaction t = sess.beginTransaction();					//��ʼһ������
		if(name.equals("StockInfo")){
			String hql = "select sum(sd.sdtotalprice) from"+
						" StockDetail as sd where sd.sid='"+id+"'";
			List<Double> list = (List<Double>)getInfo(hql);
			StockInfo si = (StockInfo)sess.get(StockInfo.class,id);
			si.setStotalprice(list.get(0));
			sess.save(si);
		}
		else if(name.equals("SellInfo")){
			String hql = "select sum(sd.edtotalprice) from"+
							" SellDetail as sd where sd.eid='"+id+"'";
			List<Double> list = (List<Double>)getInfo(hql);
			SellInfo si = (SellInfo)sess.get(SellInfo.class,id);
			si.setEtotalprice(list.get(0));
			sess.save(si);
		}
		t.commit();
		sess.close();
	}
}