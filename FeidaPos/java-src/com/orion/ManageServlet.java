																																																																																																																															package com.orion;

import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;
import java.util.*;
import org.springframework.web.context.support.*;
import org.springframework.web.context.*;
import org.springframework.beans.factory.*;
import java.text.DateFormat;

public class ManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // ������������ʽ
		response.setCharacterEncoding("UTF-8"); // ������Ӧ�����ʽ
		response.setContentType("text/html;charset=UTF-8"); // ��������ҳ���ʽ
		PrintWriter out = response.getWriter(); // �õ����������
		HttpSession session = request.getSession();//�õ�httpsession����
		UserBean userBean = (UserBean) session.getAttribute("userBean");//�ӻỰ��������ȡ��һ��֮ǰ�洢��ֵ
		if (userBean == null) {
			userBean = new UserBean();
		}
		// ��ȡWebApplicationContext
		WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		DButil db = (DButil) wac.getBean("DButil");
		DBinsert dbin = (DBinsert) wac.getBean("DBinsert");
		DBupdate dbup = (DBupdate) wac.getBean("DBupdate");
		DBdelete dbde = (DBdelete) wac.getBean("DBdelete");
		String action = request.getParameter("action").trim(); // �õ�������
		if (action.equals("login")) { // ����Ϊ��½ʱ
			String aname = request.getParameter("uname").trim();// �õ��û���
			String apwd = request.getParameter("upwd").trim(); // �õ�����
			System.out.println(aname + "\t" + apwd);
			String hql = "from AdminInfo as p " + "where p.aname='" + aname + "' and p.apwd='" + apwd + "'";
			List<AdminInfo> list = (List<AdminInfo>) db.getInfo(hql);
			String url = ""; // ��¼��ʾ��Ϣ
			if (!list.isEmpty()) {
				AdminInfo ai = list.get(0);
				url = "/index.jsp";
				session.setAttribute("admin", aname); // ������Ա������session
				session.setAttribute("alevel", ai.getAlevel()); // ������Ա�������session
			} else {
				String msg = "�Բ���,��½ʧ��!!!";
				request.setAttribute("msg", msg); // ��������Ϣ��ӵ�������
				url = "/info.jsp";
			}
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("logout")) { // ������Աע��ʱ
			request.getSession(true).invalidate(); // ʹsessionʧЧ
			response.sendRedirect("adminlogin.jsp"); // ҳ����ת
		} else if (action.equals("search")) { // ������Ϊ����ʱ
			String key = request.getParameter("key").trim(); // �õ������ؼ���
			String type = request.getParameter("type").trim(); // �õ���������
			userBean.setNowPage(1);
			//key = new String(key.getBytes(), "ISO-8859-1");
			String hql = ""; // ��¼��������
			String tp = ""; // ��¼����������ҳ��
			String url = ""; // ���������ת��ַ
			if (type.equals("goodsinfo")) { // ��������Ʒ��ʱ
				String myradio = request.getParameter("myradio");
				if (myradio != null && myradio.trim().equals("class")) {
					hql = "from GoodsInfo as gi where gi.gcid in "
							+ "(select gc.gcid from GoodsClassInfo as "
							+ "gc where gc.gcname like '%" + key + "%')";
					tp = "select count(*) from GoodsInfo as gi where gi.gcid in "
							+ "(select gc.gcid from GoodsClassInfo as "
							+ "gc where gc.gcname like '%" + key + "%')";
				} else {
					hql = "from GoodsInfo where gname like '%" + key + "%'";
					tp = "select count(*) from GoodsInfo where gname like '%"
							+ key + "%'";
				}
				url = "/goodsmanage.jsp"; // ��תҳ��
			} else if (type.equals("goodsclassinfo")) { // ���������ʱ
				hql = "from GoodsClassInfo where gcname like '%" + key + "%'";// ��������hql
				tp = "select count(*) from GoodsClassInfo where gcname like '%"
						+ key + "%'";// ������ҳ����hql
				url = "/goodsclassmanage.jsp"; // ��ס��תҳ
			} else if (type.equals("consumerinfo")) { // �������ͻ�ʱ
				hql = "from ConsumerInfo where cname like '%" + key + "%'"; // �õ�������hql
				tp = "select count(*) from ConsumerInfo where cname like '%"
						+ key + "%'"; // ������ҳ����hql
				url = "/consumermanage.jsp"; // Ҫ��ת����url
			} else if (type.equals("providerinfo")) {
				hql = "from ProviderInfo where pname like '%" + key + "%'"; // �õ�������hql
				tp = "select count(*) from ProviderInfo where pname like '%"
						+ key + "%'"; // ������ҳ����hql
				url = "/providermanage.jsp"; // Ҫ��ת����url
			} else if (type.equals("stockinfo")) {
				hql = "from StockInfo where sid like '%" + key + "%'"; // �õ�������hql
				tp = "select count(*) from StockInfo where sid like '%" + key
						+ "%'";// �õ�������ҳ����hql
				url = "/stockmanage.jsp"; // Ҫ��ת����url
			} else if (type.equals("sellinfo")) {
				hql = "from SellInfo where eid like '%" + key + "%'"; // �õ����������hql
				tp = "select count(*) from SellInfo where eid like '%" + key
						+ "%'";// �õ�������ҳ����hql
				url = "/sellmanage.jsp"; // Ҫ��ת����url
			} else if (type.equals("admininfo")) {
				hql = "from AdminInfo where aname like '%" + key + "%'"; // �õ����������hql
				tp = "select count(*) from AdminInfo where aname like '%" + key
						+ "%'";// �õ�������ҳ����hql
				url = "/adminmanage.jsp"; // Ҫ��ת����url
			} else if (type.equals("sta")) { // ���ͳ��
				String myradio = request.getParameter("myradio").trim();
				int gamount = Integer.parseInt(key);
				if (myradio.equals("more")) {
					hql = "from GoodsInfo as gi where gi.gamount>=" + gamount;
					tp = "select count(*) from GoodsInfo as gi where gi.gamount>="
							+ gamount;
				} else {
					hql = "from GoodsInfo as gi where gi.gamount<=" + gamount;
					tp = "select count(*) from GoodsInfo as gi where gi.gamount<="
							+ gamount;
				}
				url = "/statistic.jsp"; // Ҫ��ת����url
			} else if (type.equals("consumerback")) { // �ͻ��˻�
				hql = "from ConsumerBack as cb where cb.cbid like '%" + key
						+ "%'";
				tp = "select count(*) from ConsumerBack as cb where cb.cbid like '%"
						+ key + "%'";
				url = "/consumerbackmanage.jsp";
			} else if (type.equals("providerback")) {
				hql = "from ProviderBack as pb where pb.pbid like '%" + key
						+ "%'";
				tp = "select count(*) from ProviderBack as pb where pb.pbid like '%"
						+ key + "%'";
				url = "/providerbackmanage.jsp";
			}
			userBean.setHql(hql); // ��ס��ǰhql
			userBean.setPageHql(tp); // ��ס������ҳ����hql
			int totalPage = db.getTotalPage(tp, userBean.getSpan());
			userBean.setTotalPage(totalPage); // ��ס��ǰ��ҳ��
			List list = db.getPageContent(hql, userBean.getNowPage(), userBean
					.getSpan());
			request.setAttribute("goodslist", list); // ��ҳ�����ݷ���������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("changePage")) {
			String page = request.getParameter("page").trim(); // �õ�Ҫ��ת����ҳ��
			String url = request.getParameter("pagename").trim(); // �õ�ҳ�������
			userBean.setNowPage(Integer.parseInt(page)); // ��¼ҳ��
			List goodslist = db.getPageContent(userBean.getHql(), userBean
					.getNowPage(), userBean.getSpan()); // �õ���Ʒ�б�
			request.setAttribute("goodslist", goodslist); // ���б����������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("addGoods")) {
			String gname = request.getParameter("gname").trim(); // �õ���Ʒ����
			String gcname = request.getParameter("gcname").trim(); // �õ���Ʒ���
			String gunit = request.getParameter("gunit").trim(); // �õ���Ʒ��λ
			String pin = request.getParameter("gpin").trim(); // �õ���Ʒ����
			String pout = request.getParameter("gpout").trim(); // �õ���Ʒ�ۼ�
			String amount = request.getParameter("gamount").trim(); // �õ���Ʒ����
			String gid = db.getId("GoodsInfo", "gid"); // �õ���Ʒ��ID
			//gname = new String(gname.getBytes(), "ISO-8859-1"); // ת��
			//gcname = new String(gcname.getBytes(), "ISO-8859-1"); // ת��
			String hql = "select gg.gcid from GoodsClassInfo as gg where gg.gcname='"
					+ gcname + "'";
			String gcid = (String) ((db.getInfo(hql)).get(0)); // �õ����ID
			String temp = "from GoodsInfo as gi where gi.gname='" + gname + "'";
			List li = db.getInfo(temp);
			String url = "";
			if (li.isEmpty()) {
				//gunit = new String(gunit.getBytes(), "ISO-8859-1"); // ת��
				double gpin = Double.parseDouble(pin); // ��StringתΪdouble��
				double gpout = Double.parseDouble(pout); // ��StringתΪdouble��
				int gamount = Integer.parseInt(amount); // ��StringתΪint��
				GoodsInfo gi = new GoodsInfo(gid, gname, gcid, gunit, gpin,
						gpout, gamount);
				dbin.insertTable("GoodsInfo", gi); // ���±��
				// out.println("eval(\'alert(\'��ϲ��,��ӳɹ�!!!\')\')");
				int totalPage = db.getTotalPage(userBean.getPageHql(), userBean
						.getSpan());
				userBean.setTotalPage(totalPage); // ��ס��ǰ��ҳ��
				List goodslist = db.getPageContent(userBean.getHql(), userBean
						.getNowPage(), userBean.getSpan()); // �õ���Ʒ�б�
				request.setAttribute("goodslist", goodslist); // ���б�ŵ�������
				url = "/goodsmanage.jsp";
			} else {
				url = "/info.jsp";
				String msg = "����Ʒ�Ѿ�����,�������!!!";
				request.setAttribute("msg", msg);
			}
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("lookGoods")) {
			String gid = request.getParameter("gid").trim(); // �õ���ƷID
			GoodsInfo gi = (GoodsInfo) db.getObject("GoodsInfo", gid);// �õ���Ʒ����
			request.setAttribute("object", gi); // ����Ʒ�������������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher("/modifygoods.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("modifyGoods")) {
			String gid = request.getParameter("gid").trim(); // �õ���Ʒ��ID
			String gname = request.getParameter("gname").trim(); // �õ���Ʒ����
			String gcname = request.getParameter("gcname").trim(); // �õ���Ʒ���
			String gunit = request.getParameter("gunit").trim(); // �õ���Ʒ��λ
			String pin = request.getParameter("gpin").trim(); // �õ���Ʒ����
			String pout = request.getParameter("gpout").trim(); // �õ���Ʒ�ۼ�
			String amount = request.getParameter("gamount").trim(); // �õ���Ʒ����
			//gname = new String(gname.getBytes(), "ISO-8859-1"); // ת��
			//gcname = new String(gcname.getBytes(), "ISO-8859-1"); // ת��
			//gunit = new String(gunit.getBytes(), "ISO-8859-1"); // ת��
			double gpin = Double.parseDouble(pin); // ��StringתΪdouble��
			double gpout = Double.parseDouble(pout); // ��StringתΪdouble��
			int gamount = Integer.parseInt(amount); // ��StringתΪint��
			String hql = "select gcid from GoodsClassInfo where gcname='"
					+ gcname + "'";
			String gcid = (String) ((db.getInfo(hql)).get(0)); // �õ����ID
			GoodsInfo gi = new GoodsInfo(gid, gname, gcid, gunit, gpin, gpout,
					gamount);
			dbup.updateTable("GoodsInfo", gi, gid);
			List goodslist = db.getPageContent(userBean.getHql(), userBean
					.getNowPage(), userBean.getSpan());
			request.setAttribute("goodslist", goodslist); //
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher("/goodsmanage.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("deleteGoods")) { // ������Ϊɾ����Ʒʱ
			String gid = request.getParameter("gid").trim(); // �õ���ƷID
			dbde.deleteTable("GoodsInfo", gid);
			int totalPage = db.getTotalPage(userBean.getPageHql(), userBean
					.getSpan());
			userBean.setTotalPage(totalPage); // ��ס��ǰ��ҳ��
			userBean.setNowPage(1); // ���õ�ǰҳΪ1
			List goodslist = db.getPageContent(userBean.getHql(), userBean
					.getNowPage(), userBean.getSpan()); // �õ���Ʒ�б�
			request.setAttribute("goodslist", goodslist); // ���б����������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher("/goodsmanage.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("addGoodsClass")) { // ������Ϊ�����Ʒ���ʱ
			String gcname = request.getParameter("gcname").trim(); // �õ�Ҫ��ӵ�����
			//gcname = new String(gcname.getBytes(), "ISO-8859-1"); // ������ת��
			String hql = "from GoodsClassInfo as gci where gci.gcname='"
					+ gcname + "'";
			List gclist = db.getInfo(hql);
			String url = "/goodsclassmanage.jsp";
			if (gclist.isEmpty()) {
				String gcid = db.getId("GoodsClassInfo", "gcid"); // �õ�Ҫ��������ID
				GoodsClassInfo gci = new GoodsClassInfo(gcid, gcname);
				dbin.insertTable("GoodsClassInfo", gci);
				int totalPage = db.getTotalPage(userBean.getPageHql(), userBean
						.getSpan());
				userBean.setTotalPage(totalPage); // ��ס��ǰ��ҳ��
				List goodslist = db.getPageContent(userBean.getHql(), userBean
						.getNowPage(), userBean.getSpan()); // �õ���Ʒ����б�
				request.setAttribute("goodslist", goodslist); // ���б�ŵ�������
			} else {
				url = "/info.jsp";
				String msg = "������Ѿ�����!!!";
				request.setAttribute("msg", msg);
			}

			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("lookGoodsClass")) {
			String gcid = request.getParameter("gcid").trim(); // �õ���Ʒ���ID
			GoodsClassInfo gci = (GoodsClassInfo) db.getObject(
					"GoodsClassInfo", gcid);// �õ�������
			request.setAttribute("object", gci); // �����������������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc
					.getRequestDispatcher("/modifygoodsclass.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("modifyGoodsClass")) { // �޸���Ʒ���ʱ
			String gcid = request.getParameter("gcid").trim(); // �õ�Ҫ�޸����ID
			String gcname = request.getParameter("gcname").trim(); // �õ�����
			//gcname = new String(gcname.getBytes(), "ISO-8859-1"); // ������ת��
			String url = "/goodsclassmanage.jsp";
			String hql = "from GoodsClassInfo as gci where gci.gcname='"
					+ gcname + "'";
			List list = db.getInfo(hql);
			if (list.isEmpty()) {
				GoodsClassInfo gci = new GoodsClassInfo(gcid, gcname); // ��������
				dbup.updateTable("GoodsClassInfo", gci, gcid); // ���¶���
				List goodslist = db.getPageContent(userBean.getHql(), userBean
						.getNowPage(), userBean.getSpan()); // �õ�Ҫ��ʾ������
				request.setAttribute("goodslist", goodslist); // �����ݴ���������
			} else {
				url = "/info.jsp";
				String msg = "�������Ѿ�����,�����޸�!!!";
				request.setAttribute("msg", msg);
			}
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("deleteGoodsClass")) {
			String gcid = request.getParameter("gcid").trim(); // �õ����ID
			dbde.deleteTable("GoodsClassInfo", gcid); // ���ö���ɾ��
			int totalPage = db.getTotalPage(userBean.getPageHql(), userBean
					.getSpan());
			userBean.setTotalPage(totalPage); // ��ס��ǰ��ҳ��
			userBean.setNowPage(1); // ���õ�ǰҳΪ1
			List goodslist = db.getPageContent(userBean.getHql(), userBean
					.getNowPage(), userBean.getSpan()); // �õ���Ʒ�б�
			request.setAttribute("goodslist", goodslist); // ���б����������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc
					.getRequestDispatcher("/goodsclassmanage.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("addConsumer")) {
			String cname = request.getParameter("cname").trim(); // �õ��ͻ���
			String clinkman = request.getParameter("clinkman").trim(); // �õ���ϵ��
			String caddress = request.getParameter("caddress").trim(); // �õ���˾��ַ
			String ctel = request.getParameter("ctel").trim(); // �õ���˾�绰
			String cemail = request.getParameter("cemail").trim(); // �õ���˾E-mail
			String cremark = request.getParameter("cremark").trim(); // �õ��ͻ���ע
			if (cemail.equals("")) {
				cemail = "����";
			}
			if (cremark.equals("")) {
				cremark = "����";
			}
			//cname = new String(cname.getBytes(), "ISO-8859-1"); // ������ת��
			//clinkman = new String(clinkman.getBytes(), "ISO-8859-1"); // ����ϵ��ת��
			//caddress = new String(caddress.getBytes(), "ISO-8859-1"); // ����ַת��
			//ctel = new String(ctel.getBytes(), "ISO-8859-1"); // ���绰ת��
			//cemail = new String(cemail.getBytes(), "ISO-8859-1"); // ��E-mailת��
			//cremark = new String(cremark.getBytes(), "ISO-8859-1"); // ����עת��
			String url = "/consumermanage.jsp";
			String temp = "from ConsumerInfo as ci where ci.cname='" + cname
					+ "'";
			List clist = db.getInfo(temp);
			if (clist.isEmpty()) {
				String cid = db.getId("ConsumerInfo", "cid"); // �õ�ID
				ConsumerInfo ci = new ConsumerInfo(cid, cname, clinkman,
						caddress, ctel, cemail, cremark);
				dbin.insertTable("ConsumerInfo", ci); // ���±��
				int totalPage = db.getTotalPage(userBean.getPageHql(), userBean
						.getSpan());
				userBean.setTotalPage(totalPage); // ��ס��ǰ��ҳ��
				List goodslist = db.getPageContent(userBean.getHql(), userBean
						.getNowPage(), userBean.getSpan()); // �õ��б�
				request.setAttribute("goodslist", goodslist); // ���б�ŵ�������
			} else {
				String msg = "�ÿͻ��Ѵ���!!!";
				url = "/info.jsp";
				request.setAttribute("msg", msg);
			}
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("lookConsumer")) {
			String cid = request.getParameter("cid").trim(); // �õ��ͻ�ID
			String type = request.getParameter("type").trim(); // �õ��鿴����
			String url = "/lookconsumer.jsp"; // ��תҳ��
			if (type.equals("modify")) { // ������Ϊ�޸�ʱ
				url = "/modifyconsumer.jsp"; // ����URL
			}
			ConsumerInfo ci = (ConsumerInfo) db.getObject("ConsumerInfo", cid); // �õ�����
			request.setAttribute("object", ci); // �����������������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("modifyConsumer")) {
			System.out.println("modifyConsumer");
			String cid = request.getParameter("cid").trim();
			String cname = request.getParameter("cname").trim(); // �õ��ͻ���
			String clinkman = request.getParameter("clinkman").trim(); // �õ���ϵ��
			String caddress = request.getParameter("caddress").trim(); // �õ���˾��ַ
			String ctel = request.getParameter("ctel").trim(); // �õ���˾�绰
			String cemail = request.getParameter("cemail").trim(); // �õ���˾E-mail
			String cremark = request.getParameter("cremark").trim(); // �õ��ͻ���ע
			if (cemail.equals("")) {
				cemail = "����";
			}
			if (cremark.equals("")) {
				cremark = "����";
			}
			ConsumerInfo ci = new ConsumerInfo(cid, cname, clinkman, caddress,
					ctel, cemail, cremark);
			dbup.updateTable("ConsumerInfo", ci, cid); // ���±��
			List goodslist = db.getPageContent(userBean.getHql(), userBean
					.getNowPage(), userBean.getSpan()); // �õ��б�
			request.setAttribute("goodslist", goodslist); // ���б�ŵ�������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc
					.getRequestDispatcher("/consumermanage.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("deleteConsumer")) {
			String cid = request.getParameter("cid").trim(); // �õ��ͻ�ID
			dbde.deleteTable("ConsumerInfo", cid); // ���ö���ɾ��
			int totalPage = db.getTotalPage(userBean.getPageHql(), userBean
					.getSpan());
			userBean.setTotalPage(totalPage); // ��ס��ǰ��ҳ��
			userBean.setNowPage(1); // ���õ�ǰҳΪ1
			List goodslist = db.getPageContent(userBean.getHql(), userBean
					.getNowPage(), userBean.getSpan()); // �õ��б�
			request.setAttribute("goodslist", goodslist); // ���б����������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc
					.getRequestDispatcher("/consumermanage.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("addProvider")) {
			String pname = request.getParameter("pname").trim(); // �õ���Ӧ����
			String plinkman = request.getParameter("plinkman").trim(); // �õ���ϵ��
			String paddress = request.getParameter("paddress").trim(); // �õ���˾��ַ
			String ptel = request.getParameter("ptel").trim(); // �õ���˾�绰
			String pemail = request.getParameter("pemail").trim(); // �õ���˾E-mail
			String premark = request.getParameter("premark").trim(); // �õ��ͻ���ע
			if (pemail.equals("")) {
				pemail = "����";
			}
			if (premark.equals("")) {
				premark = "����";
			}
			String temp = "from ProviderInfo as pi where pi.pname='" + pname
					+ "'";
			List plist = db.getInfo(temp);
			String url = "/providermanage.jsp";
			if (plist.isEmpty()) {
				String pid = db.getId("ProviderInfo", "pid"); // �õ�ID
				ProviderInfo pi = new ProviderInfo(pid, pname, plinkman,
						paddress, ptel, pemail, premark);
				dbin.insertTable("ProviderInfo", pi); // ���±��
				int totalPage = db.getTotalPage(userBean.getPageHql(), userBean
						.getSpan());
				userBean.setTotalPage(totalPage); // ��ס��ǰ��ҳ��
				List goodslist = db.getPageContent(userBean.getHql(), userBean
						.getNowPage(), userBean.getSpan()); // �õ��б�
				request.setAttribute("goodslist", goodslist); // ���б�ŵ�������
			} else {
				url = "/info.jsp";
				String msg = "�ù�Ӧ���Ѿ�����!!!";
				request.setAttribute("msg", msg);
			}
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("lookProvider")) {
			String pid = request.getParameter("pid").trim(); // �õ���Ӧ��ID
			String type = request.getParameter("type").trim(); // �õ��鿴����
			String url = "/lookprovider.jsp"; // ��ת��ַ
			if (type.equals("modify")) { // ������Ϊ�޸�ʱ
				url = "/modifyprovider.jsp";
			}
			ProviderInfo pi = (ProviderInfo) db.getObject("ProviderInfo", pid);// �õ�����
			request.setAttribute("object", pi); // ���������������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("modifyProvider")) {
			String pid = request.getParameter("pid").trim(); // �õ���Ӧ��ID
			String pname = request.getParameter("pname").trim(); // �õ���Ӧ����
			String plinkman = request.getParameter("plinkman").trim(); // �õ���ϵ��
			String paddress = request.getParameter("paddress").trim(); // �õ���˾��ַ
			String ptel = request.getParameter("ptel").trim(); // �õ���˾�绰
			String pemail = request.getParameter("pemail").trim(); // �õ���˾E-mail
			String premark = request.getParameter("premark").trim(); // �õ��ͻ���ע
			if (pemail.equals("")) {
				pemail = "����";
			}
			if (premark.equals("")) {
				premark = "����";
			}
			ProviderInfo pi = new ProviderInfo(pid, pname, plinkman, paddress,
					ptel, pemail, premark);
			dbup.updateTable("ProviderInfo", pi, pid); // ���±��
			List goodslist = db.getPageContent(userBean.getHql(), userBean
					.getNowPage(), userBean.getSpan()); // �õ��б�
			request.setAttribute("goodslist", goodslist); // ���б�ŵ�������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc
					.getRequestDispatcher("/providermanage.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("deleteProvider")) {
			String pid = request.getParameter("pid").trim(); // �õ���Ӧ��ID
			dbde.deleteTable("ProviderInfo", pid); // ���ö���ɾ��
			int totalPage = db.getTotalPage(userBean.getPageHql(), userBean
					.getSpan());
			userBean.setTotalPage(totalPage); // ��ס��ǰ��ҳ��
			userBean.setNowPage(1); // ���õ�ǰҳΪ1
			List goodslist = db.getPageContent(userBean.getHql(), userBean
					.getNowPage(), userBean.getSpan()); // �õ��б�
			request.setAttribute("goodslist", goodslist); // ���б����������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc
					.getRequestDispatcher("/providermanage.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("addStock")) {
			String stp = request.getParameter("stp").trim(); // �õ��ܼ۸�
			String pname = request.getParameter("pname").trim(); // �õ���Ӧ��
			String sbuyer = request.getParameter("sbuyer").trim(); // �õ��ɹ���
			double stotalprice = Double.parseDouble(stp); // ����ת��
			//pname = new String(pname.getBytes(), "ISO-8859-1"); // ����Ӧ����ת��
			//sbuyer = new String(sbuyer.getBytes(), "ISO-8859-1"); // ���ɹ���ת��
			String hql = "select pid from ProviderInfo where pname='" + pname
					+ "'";
			String pid = (String) ((db.getInfo(hql)).get(0)); // �õ���Ӧ��ID
			String sid = db.getId("StockInfo", "sid"); // �õ�Ҫ��������ID
			StockInfo si = new StockInfo(sid, pid, new Date(), stotalprice,
					sbuyer);
			dbin.insertTable("StockInfo", si); // �����¼
			int totalPage = db.getTotalPage(userBean.getPageHql(), userBean
					.getSpan());
			userBean.setTotalPage(totalPage); // ��ס��ǰ��ҳ��
			List goodslist = db.getPageContent(userBean.getHql(), userBean
					.getNowPage(), userBean.getSpan()); // �õ��б�
			request.setAttribute("goodslist", goodslist); // ���б�ŵ�������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher("/stockmanage.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("lookStock")) {
			String sid = request.getParameter("sid").trim(); // �õ��ɹ���ID
			String type = request.getParameter("type").trim(); // �õ��鿴
			String url = "/addstockdetail.jsp"; // Ŀ�ĵ�
			if (type.equals("look")) { // ��Ϊ�鿴ʱ
				url = "/lookstock.jsp"; // ����URL
			} else if (type.equals("modify")) { // ��Ϊ�޸�ʱ
				url = "/modifystock.jsp"; // ����URL
			}
			StockInfo si = (StockInfo) db.getObject("StockInfo", sid); // �õ�����
			String hql = "from StockDetail as sd where sd.sid='" + sid + "'"; // ���������hql
			List<StockDetail> list = (List<StockDetail>) db.getInfo(hql); // �õ������б�
			request.setAttribute("si", si); // ������ŵ�������
			request.setAttribute("list", list); // �������б����������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("addStockDetail")) { // ����Ӳɹ���ϸ
			String sid = request.getParameter("sid").trim(); // �õ��ɹ���ID
			String amount = request.getParameter("sdamount").trim(); // �õ��ɹ�����
			String gname = request.getParameter("gname").trim(); // �õ���Ʒ����
			String hql = "from GoodsInfo as gi where gi.gname='" + gname + "'"; // ������Ʒ
			List<GoodsInfo> list = (List<GoodsInfo>) db.getInfo(hql); // �õ���Ʒ�б�
			GoodsInfo gi = list.get(0); // �õ���Ʒ����
			String sdid = db.getId("StockDetail", "sdid"); // �õ���ϸID
			int sdamount = Integer.parseInt(amount); // ת������
			double sdprice = gi.getGpin(); // ����
			double sdtotalprice = sdprice * sdamount; // �õ��ܼ�
			StockDetail sd = new StockDetail(sdid, sid, gi.getGid(), sdamount,
					sdprice, sdtotalprice);
			dbin.insertTable("StockDetail", sd); // �����¼
			StockInfo si = (StockInfo) db.getObject("StockInfo", sid); // �õ��ɹ�����
			String temp = "from StockDetail as sd where sd.sid='" + sid + "'"; // ���������hql
			List<StockDetail> li = (List<StockDetail>) db.getInfo(temp); // �õ������б�
			request.setAttribute("si", si); // ������ŵ�������
			request.setAttribute("list", li); // �������б����������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc
					.getRequestDispatcher("/addstockdetail.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("modifyStock")) { // ���޸Ĳɹ���Ϣʱ
			String sid = request.getParameter("sid").trim(); // �õ��ɹ�ID
			String pname = request.getParameter("pname").trim(); // �õ���Ӧ������
			String sbuyer = request.getParameter("sbuyer").trim(); // �õ��ɹ���
			String sdate = request.getParameter("sdate").trim(); // �õ��ɹ�����
			String hql = "from ProviderInfo as pi where pi.pname='" + pname+ "'"; // ������Ӧ��ID��hql
			ProviderInfo pi = (ProviderInfo) db.getInfo(hql).get(0); // �õ���Ӧ�̶���
			StockInfo si = (StockInfo) db.getObject("StockInfo", sid); // �õ��ɹ�����
			si.setPid(pi.getPid()); // ���òɹ���ID
			si.setSdate(db.getDate(sdate)); // ���òɹ�����
			si.setSbuyer(sbuyer); // ���òɹ���
			dbup.updateTable("StockInfo", si, sid); // ִ�и���
			String temp = "from StockDetail as sd where sd.sid='" + sid + "'"; // ���������hql
			List<StockDetail> li = (List<StockDetail>) db.getInfo(temp); // �õ������б�
			request.setAttribute("si", si); // ������ŵ�������
			request.setAttribute("list", li); // �������б����������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher("/modifystock.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("modifyStockDetail")) { // �޸Ĳɹ���ϸʱ
			String sdid = request.getParameter("sdid").trim(); // �õ��ɹ���ϸID
			String sdamount = request.getParameter("sdamount").trim(); // �õ��޸�����
			StockDetail sd = (StockDetail) db.getObject("StockDetail", sdid); // �õ��ɹ���ϸ����
			sd.setSdamount(Integer.parseInt(sdamount)); // ��������
			dbup.updateTable("StockDetail", sd, sdid); // ִ�и���
			String sid = sd.getSid(); // �õ�Sid
			StockInfo si = (StockInfo) db.getObject("StockInfo", sid); // �õ��ɹ�����
			String temp = "from StockDetail as sd where sd.sid='" + sid + "'"; // ���������hql
			List<StockDetail> li = (List<StockDetail>) db.getInfo(temp); // �õ������б�
			request.setAttribute("si", si); // ������ŵ�
			request.setAttribute("list", li); // �������б����������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher("/modifystock.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("deleteStockDetail")) {
			String sdid = request.getParameter("sdid").trim();
			String sid = request.getParameter("sid").trim();
			StockDetail sd = (StockDetail) db.getObject("StockDetail", sdid);
			dbde.deleteTable("StockDetail", sdid);
			StockInfo si = (StockInfo) db.getObject("StockInfo", sid); // �õ��ɹ�����
			String temp = "from StockDetail as sd where sd.sid='" + sid + "'"; // ���������hql
			List<StockDetail> li = (List<StockDetail>) db.getInfo(temp); // �õ������б�
			request.setAttribute("si", si); // ������ŵ�������
			request.setAttribute("list", li); // �������б����������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher("/modifystock.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("deleteStock")) {
			String sid = request.getParameter("sid").trim();
			dbde.deleteTable("StockInfo", sid);
			int totalPage = db.getTotalPage(userBean.getPageHql(), userBean
					.getSpan());
			userBean.setNowPage(1); // ���õ�ǰҳΪ��һҳ
			userBean.setTotalPage(totalPage); // ��ס��ǰ��ҳ��
			List goodslist = db.getPageContent(userBean.getHql(), userBean
					.getNowPage(), userBean.getSpan()); // �õ��б�
			request.setAttribute("goodslist", goodslist); // ���б�ŵ�������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher("/stockmanage.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("addSell")) {
			String cname = request.getParameter("cname").trim(); // �õ��ͻ�����
			String etp = request.getParameter("etotalprice").trim(); // �õ��ܼ۸�
			String eseller = request.getParameter("eseller").trim(); // �õ����۱�
			double etotalprice = Double.parseDouble(etp); // ����ת��
			
			String hql = "select cid from ConsumerInfo where cname ='" + cname
					+ "'";
			String cid = (String) ((db.getInfo(hql)).get(0)); // �õ��ͻ�ID
			String eid = db.getId("SellInfo", "eid"); // �õ�����ID
			SellInfo ei = new SellInfo(eid, cid, new Date(), etotalprice,
					eseller);
			dbin.insertTable("SellInfo", ei); // �����¼
			int totalPage = db.getTotalPage(userBean.getPageHql(), userBean
					.getSpan());
			userBean.setTotalPage(totalPage); // ��ס��ǰ��ҳ��
			List goodslist = db.getPageContent(userBean.getHql(), userBean
					.getNowPage(), userBean.getSpan()); // �õ��б�
			request.setAttribute("goodslist", goodslist); // ���б�ŵ�������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher("/sellmanage.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("lookSell")) {
			String eid = request.getParameter("eid").trim(); // �õ����۱�ID
			String type = request.getParameter("type").trim(); // �õ��鿴
			String url = "/addselldetail.jsp"; // Ŀ�ĵ�
			if (type.equals("look")) { // ��Ϊ�鿴ʱ
				url = "/looksell.jsp"; // ����URL
			} else if (type.equals("modify")) { // ��Ϊ�޸�ʱ
				url = "/modifysell.jsp"; // ����URL
			}
			SellInfo ei = (SellInfo) db.getObject("SellInfo", eid); // �õ�����
			String hql = "from SellDetail as ed where ed.eid='" + eid + "'"; // ���������hql
			List<SellDetail> list = (List<SellDetail>) db.getInfo(hql); // �õ������б�
			request.setAttribute("ei", ei); // ������ŵ�������
			request.setAttribute("list", list); // �������б����������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("addSellDetail")) {
			String eid = request.getParameter("eid").trim(); // �õ����۵�ID
			String amount = request.getParameter("edamount").trim(); // �õ���������
			String gname = request.getParameter("gname").trim(); // �õ���Ʒ����
			String hql = "from GoodsInfo as gi where gi.gname='" + gname + "'"; // ������Ʒ
			List<GoodsInfo> list = (List<GoodsInfo>) db.getInfo(hql); // �õ���Ʒ�б�
			GoodsInfo gi = list.get(0); // �õ���Ʒ����
			String edid = db.getId("SellDetail", "edid"); // �õ���ϸID
			int edamount = Integer.parseInt(amount); // ת������
			String url = "/addselldetail.jsp";
			if (gi.getGamount() >= edamount) { // ��Ʒ������ʱ
				double edprice = gi.getGpout(); // �ۼ�
				double edtotalprice = edprice * edamount; // �õ��ܼ�
				SellDetail ed = new SellDetail(edid, eid, gi.getGid(),
						edamount, edprice, edtotalprice);
				dbin.insertTable("SellDetail", ed); // �����¼
				SellInfo ei = (SellInfo) db.getObject("SellInfo", eid); // �õ��ɹ�����
				String temp = "from SellDetail as sd where sd.eid='" + eid
						+ "'"; // ���������hql
				List<SellDetail> li = (List<SellDetail>) db.getInfo(temp); // �õ������б�
				request.setAttribute("ei", ei); // ������ŵ�������
				request.setAttribute("list", li); // �������б����������
			} else { // ��Ʒ��������
				url = "/info.jsp"; // ��תҳ��
				String msg = "��Ʒ��������,ʣ����Ϊ:" + gi.getGamount(); // ��ʾ��Ϣ
				request.setAttribute("msg", msg); // ����Ϣ����������
			}
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("modifySell")) {
			String eid = request.getParameter("eid").trim(); // �õ��ɹ�ID
			String cname = request.getParameter("cname").trim(); // �õ���Ӧ������
			String eseller = request.getParameter("eseller").trim(); // �õ��ɹ���
			String edate = request.getParameter("edate").trim(); // �õ��ɹ�����
			String hql = "from ConsumerInfo as ci where ci.cname='" + cname+ "'"; // ������Ӧ��ID��hql
			ConsumerInfo ci = (ConsumerInfo) db.getInfo(hql).get(0); // �õ���Ӧ�̶���
			SellInfo ei = (SellInfo) db.getObject("SellInfo", eid); // �õ��ɹ�����
			ei.setCid(ci.getCid()); // ���òɹ���ID
			ei.setEdate(db.getDate(edate)); // ���òɹ�����
			ei.setEseller(eseller); // ���òɹ���
			dbup.updateTable("SellInfo", ei, eid); // ִ�и���
			String temp = "from SellDetail as ed where ed.eid='" + eid + "'"; // ���������hql
			List<SellDetail> li = (List<SellDetail>) db.getInfo(temp); // �õ������б�
			request.setAttribute("ei", ei); // ������ŵ�������
			request.setAttribute("list", li); // �������б����������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher("/modifysell.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("modifySellDetail")) {
			String edid = request.getParameter("edid").trim(); // �õ�������ϸID
			String amount = request.getParameter("edamount").trim(); // �õ��޸�����
			int edamount = Integer.parseInt(amount);
			SellDetail ed = (SellDetail) db.getObject("SellDetail", edid); // �õ�������ϸ����
			GoodsInfo gi = (GoodsInfo) db.getObject("GoodsInfo", ed.getGid());
			String url = "/modifysell.jsp";
			if ((gi.getGamount() + ed.getEdamount() - edamount) >= 0) {
				ed.setEdamount(edamount); // ��������
				dbup.updateTable("SellDetail", ed, edid); // ִ�и���
				String eid = ed.getEid(); // �õ�Eid
				SellInfo ei = (SellInfo) db.getObject("SellInfo", eid); // �õ����۶���
				String temp = "from SellDetail as ed where ed.eid='" + eid
						+ "'"; // ���������hql
				List<SellDetail> li = (List<SellDetail>) db.getInfo(temp); // �õ������б�
				request.setAttribute("ei", ei); // ������ŵ�������
				request.setAttribute("list", li); // �������б����������
			} else {
				url = "/info.jsp"; // ��תҳ��
				String msg = "��Ʒ��������,ʣ����Ϊ:" + gi.getGamount(); // ��ʾ��Ϣ
				request.setAttribute("msg", msg); // ����Ϣ����������
			}
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("deleteSellDetail")) { // ������Ϊɾ��������ϸʱ
			String edid = request.getParameter("edid").trim(); // �õ���ϸID
			String eid = request.getParameter("eid").trim(); // �õ�����ID
			SellDetail ed = (SellDetail) db.getObject("SellDetail", edid); // �õ�������ϸ����
			dbde.deleteTable("SellDetail", edid); // ɾ������
			SellInfo ei = (SellInfo) db.getObject("SellInfo", eid); // �õ����۶���
			String temp = "from SellDetail as ed where ed.eid='" + eid + "'"; // ���������hql
			List<SellDetail> li = (List<SellDetail>) db.getInfo(temp); // �õ������б�
			request.setAttribute("ei", ei); // ������ŵ�������
			request.setAttribute("list", li); // �������б����������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher("/modifysell.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("deleteSell")) { // ������Ϊɾ������ʱ
			String eid = request.getParameter("eid").trim(); // �õ�����ID
			dbde.deleteTable("SellInfo", eid);
			int totalPage = db.getTotalPage(userBean.getPageHql(), userBean
					.getSpan());
			userBean.setNowPage(1); // ���õ�ǰҳΪ��һҳ
			userBean.setTotalPage(totalPage); // ��ס��ǰ��ҳ��
			List goodslist = db.getPageContent(userBean.getHql(), userBean
					.getNowPage(), userBean.getSpan()); // �õ��б�
			request.setAttribute("goodslist", goodslist); // ���б�ŵ�������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher("/sellmanage.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("changepwd")) { // �޸�����
			String aname = request.getParameter("aname").trim();
			String apwd = request.getParameter("apwd").trim();
			String fpwd = request.getParameter("fpwd").trim();
			String hql = "from AdminInfo as p " + "where p.aname='" + aname + "' and p.apwd='" + apwd + "'";
			String msg = ""; // ��¼��ʾ��Ϣ
			List<AdminInfo> list = (List<AdminInfo>) db.getInfo(hql);
			if (!list.isEmpty()) {
				AdminInfo ai = list.get(0);
				ai.setApwd(fpwd);
				dbup.updateTable("AdminInfo", ai, ai.getAid());
				msg = "�����޸ĳɹ�!!!";
			} else {
				msg = "�Բ���,�û������������!!!";
			}
			request.setAttribute("msg", msg); // ��������Ϣ��ӵ�������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher("/info.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("addAdmin")) {
			String aname = request.getParameter("aname").trim(); // �õ�����Ա����
			String apwd = request.getParameter("apwd").trim(); // �õ�����
			//aname = new String(aname.getBytes(), "ISO-8859-1"); // ת��
			//apwd = new String(apwd.getBytes(), "ISO-8859-1"); // ת��
			String hql = "from AdminInfo as ai where ai.aname='" + aname + "'"; // ��������Ա
			List list = db.getInfo(hql); // �õ��б�
			String url = ""; // ���������ת��ַ
			if (list.isEmpty()) { // ������Ա������ʱ
				String aid = db.getId("AdminInfo", "aid"); // �õ�����ԱID
				AdminInfo ai = new AdminInfo(aid, aname, apwd, "��ͨ");
				dbin.insertTable("AdminInfo", ai); // ��Ӷ���
				url = "/adminmanage.jsp"; // ������ת��ַ
				int totalPage = db.getTotalPage(userBean.getPageHql(), userBean
						.getSpan());
				userBean.setTotalPage(totalPage); // ��ס��ǰ��ҳ��
				List goodslist = db.getPageContent(userBean.getHql(), userBean
						.getNowPage(), userBean.getSpan()); // �õ��б�
				request.setAttribute("goodslist", goodslist); // ���б�ŵ�������
			} else { // ������Ա����ʱ
				String msg = "�Բ���,�ù���Ա�Ѿ�����!!!"; // ��ʾ��Ϣ
				request.setAttribute("msg", msg); // ����Ϣ����������
				url = "/info.jsp"; // ������ת��ַ
			}
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("deleteAdmin")) { // ������Ϊɾ������Աʱ
			String aid = request.getParameter("aid").trim();
			AdminInfo ai = (AdminInfo) db.getObject("AdminInfo", aid);
			String alevel = ai.getAlevel();
			String url = "/adminmanage.jsp";
			if (alevel.equals("��ͨ")) {
				dbde.deleteTable("AdminInfo", aid);
				int totalPage = db.getTotalPage(userBean.getPageHql(), userBean
						.getSpan());
				userBean.setNowPage(1); // ���õ�ǰҳΪ��һҳ
				userBean.setTotalPage(totalPage); // ��ס��ǰ��ҳ��
				List goodslist = db.getPageContent(userBean.getHql(), userBean
						.getNowPage(), userBean.getSpan()); // �õ��б�
				request.setAttribute("goodslist", goodslist); // ���б�ŵ�������
			} else {
				String msg = "��������Ա������ɾ��!!!";
				request.setAttribute("msg", msg);
				url = "/info.jsp";
			}
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("resetApwd")) {
			String aname = request.getParameter("aname").trim(); // �õ�����Ա����
			String apwd = request.getParameter("apwd").trim(); // �õ�������
			String hql = "from AdminInfo where aname='" + aname + "'";
			AdminInfo ai = ((List<AdminInfo>) db.getInfo(hql)).get(0);
			ai.setApwd(apwd);
			dbup.updateTable("AdminInfo", ai, ai.getAid());
			List goodslist = db.getPageContent(userBean.getHql(), userBean
					.getNowPage(), userBean.getSpan()); // �õ��б�
			request.setAttribute("goodslist", goodslist); // ���б�ŵ�������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher("/adminmanage.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("addConsumerBack")) {
			String eid = request.getParameter("eid").trim(); // �õ����۱�ID
			String cbid = db.getId("ConsumerBack", "cbid"); // �õ�Ҫ��ӵ�ID
			SellInfo si = (SellInfo) db.getObject("SellInfo", eid); // �õ����۱����
			String cid = si.getCid(); // �õ��ͻ�ID
			ConsumerBack cb = new ConsumerBack(cbid, cid, eid, new Date()); // �õ��˻�����
			dbin.insertTable("ConsumerBack", cb); // ��Ӷ���
			int totalPage = db.getTotalPage(userBean.getPageHql(), userBean
					.getSpan());
			userBean.setTotalPage(totalPage); // ��ס��ǰ��ҳ��
			List goodslist = db.getPageContent(userBean.getHql(), userBean
					.getNowPage(), userBean.getSpan()); // �õ��б�
			request.setAttribute("goodslist", goodslist); // ���б�ŵ�������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc
					.getRequestDispatcher("/consumerbackmanage.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("addProviderBack")) {
			String sid = request.getParameter("sid").trim(); // �õ��ɹ���ID
			String pbid = db.getId("ProviderBack", "pbid"); // �õ�Ҫ��ӵ�ID
			StockInfo si = (StockInfo) db.getObject("StockInfo", sid); // �õ��ɹ������
			String pid = si.getPid(); // �õ���Ӧ��ID
			ProviderBack pb = new ProviderBack(pbid, pid, sid, new Date()); // �õ��˻�����
			dbin.insertTable("ProviderBack", pb); // ��Ӷ���
			int totalPage = db.getTotalPage(userBean.getPageHql(), userBean
					.getSpan());
			userBean.setTotalPage(totalPage); // ��ס��ǰ��ҳ��
			List goodslist = db.getPageContent(userBean.getHql(), userBean
					.getNowPage(), userBean.getSpan()); // �õ��б�
			request.setAttribute("goodslist", goodslist); // ���б�ŵ�������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc
					.getRequestDispatcher("/providerbackmanage.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("lookConsumerBack")) {
			String cbid = request.getParameter("cbid").trim(); // �õ��˻���ID
			String type = request.getParameter("type").trim(); // �õ��鿴����
			String url = "/addconsumerbackdetail.jsp"; // ��תURL
			if (type.equals("look")) { // ���鿴����Ϊlookʱ
				url = "/lookconsumerback.jsp"; // ����URL
			} else if (type.equals("modify")) { // ���鿴����Ϊmodifyʱ
				url = "/modifyconsumerback.jsp"; // ����URL
			}
			ConsumerBack cb = (ConsumerBack) db.getObject("ConsumerBack", cbid); // �õ�����
			String hql = "from ConsumerBackDetail as cbd where cbd.cbid='"
					+ cbid + "'"; // ���������hql
			List<ConsumerBackDetail> list = (List<ConsumerBackDetail>) db
					.getInfo(hql); // �õ������б�
			request.setAttribute("cb", cb); // ������ŵ�������
			request.setAttribute("list", list); // �������б����������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("lookProviderBack")) {
			String pbid = request.getParameter("pbid").trim(); // �õ��ɹ���ID
			String type = request.getParameter("type").trim(); // �õ��鿴����
			String url = "/addproviderbackdetail.jsp";
			if (type.equals("look")) { // ���鿴����Ϊlookʱ
				url = "/lookproviderback.jsp"; // ����URL
			} else if (type.equals("modify")) { // ���鿴����Ϊmodifyʱ
				url = "/modifyproviderback.jsp"; // ����URL
			}
			ProviderBack pb = (ProviderBack) db.getObject("ProviderBack", pbid); // �õ��ɹ��˻�����
			String hql = "from ProviderBackDetail as pbd where pbd.pbid='"
					+ pbid + "'";
			List<ProviderBackDetail> list = (List<ProviderBackDetail>) db
					.getInfo(hql);
			request.setAttribute("pb", pb);
			request.setAttribute("list", list);
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("addConsumerBackDetail")) {
			String cbid = request.getParameter("cbid").trim(); // �õ��˻���ID
			String gname = request.getParameter("gname").trim(); // �õ��˻���Ʒ��
			String amount = request.getParameter("cbdamount").trim(); // �õ��˻�����
			//gname = new String(gname.getBytes(), "ISO-8859-1"); // ����Ʒ����ת��
			String hql = "from GoodsInfo as gi where gi.gname='" + gname + "'"; // ������Ʒ
			List<GoodsInfo> list = (List<GoodsInfo>) db.getInfo(hql); // �õ���Ʒ�б�
			GoodsInfo gi = list.get(0); // �õ���Ʒ����
			String gid = gi.getGid();
			ConsumerBack cb = (ConsumerBack) db.getObject("ConsumerBack", cbid);
			int cbdamount = Integer.parseInt(amount); // ת������
			double cbdprice = gi.getGpout();
			double cbdtotalprice = cbdprice * cbdamount;
			String temp = "from SellDetail as ed where ed.eid='" + cb.getEid()
					+ "' and ed.gid='" + gi.getGid() + "'";
			SellDetail sd = ((List<SellDetail>) db.getInfo(temp)).get(0);
			String cbdid = db.getId("ConsumerBackDetail", "cbdid"); // �õ���ϸID
			String url = "/addconsumerbackdetail.jsp";
			if (sd.getEdamount() >= cbdamount) {
				ConsumerBackDetail cbd = new ConsumerBackDetail(cbdid, cbid,
						gid, cbdamount, cbdprice, cbdtotalprice);
				dbin.insertTable("ConsumerBackDetail", cbd);
				String cbdtemp = "from ConsumerBackDetail as cbd where cbd.cbid='"
						+ cbid + "'"; // ���������hql
				List<ConsumerBackDetail> li = (List<ConsumerBackDetail>) db
						.getInfo(cbdtemp); // �õ������б�
				request.setAttribute("cb", cb); // ������ŵ�������
				request.setAttribute("list", li); // �������б����������
			} else {
				url = "/info.jsp"; // ��תҳ��
				String msg = "�˻�����������������,������Ϊ:" + sd.getEdamount(); // ��ʾ��Ϣ
				request.setAttribute("msg", msg); // ����Ϣ����������
			}
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("addProviderBackDetail")) {
			String pbid = request.getParameter("pbid").trim(); // �õ��˻���ID
			String gname = request.getParameter("gname").trim(); // �õ��˻���Ʒ��
			String amount = request.getParameter("pbdamount").trim(); // �õ��˻�����
			//gname = new String(gname.getBytes(), "ISO-8859-1"); // ����Ʒ����ת��
			String hql = "from GoodsInfo as gi where gi.gname='" + gname + "'"; // ������Ʒ
			List<GoodsInfo> list = (List<GoodsInfo>) db.getInfo(hql); // �õ���Ʒ�б�
			GoodsInfo gi = list.get(0); // �õ���Ʒ����
			String gid = gi.getGid();
			ProviderBack pb = (ProviderBack) db.getObject("ProviderBack", pbid);
			int pbdamount = Integer.parseInt(amount); // ת������
			double pbdprice = gi.getGpin();
			double pbdtotalprice = pbdprice * pbdamount;
			String temp = "from StockDetail as sd where sd.sid='" + pb.getSid()
					+ "' and sd.gid='" + gi.getGid() + "'";
			StockDetail sd = ((List<StockDetail>) db.getInfo(temp)).get(0);
			String pbdid = db.getId("ProviderBackDetail", "pbdid"); // �õ���ϸID
			String url = "/addproviderbackdetail.jsp";
			if (sd.getSdamount() >= pbdamount) {
				ProviderBackDetail pbd = new ProviderBackDetail(pbdid, pbid,
						gid, pbdamount, pbdprice, pbdtotalprice);
				dbin.insertTable("ProviderBackDetail", pbd);
				String pbdtemp = "from ProviderBackDetail as pbd where pbd.pbid='"
						+ pbid + "'"; // ���������hql
				List<ProviderBackDetail> li = (List<ProviderBackDetail>) db
						.getInfo(pbdtemp); // �õ������б�
				request.setAttribute("pb", pb); // ������ŵ�������
				request.setAttribute("list", li); // �������б����������
			} else {
				url = "/info.jsp"; // ��תҳ��
				String msg = "�˻����������ɹ�����,�ɹ���Ϊ:" + sd.getSdamount(); // ��ʾ��Ϣ
				request.setAttribute("msg", msg); // ����Ϣ����������
			}
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("modifyConsumerBackDetail")) {
			String cbdid = request.getParameter("cbdid").trim(); // �õ��˻���ϸID
			String amount = request.getParameter("cbdamount").trim(); // �õ��޸ĺ�����
			int cbdamount = Integer.parseInt(amount); // ��������ת��
			ConsumerBackDetail cbd = (ConsumerBackDetail) db.getObject(
					"ConsumerBackDetail", cbdid); // �õ���ϸ����
			ConsumerBack cb = (ConsumerBack) db.getObject("ConsumerBack", cbd
					.getCbid());// �õ��˻�������
			String hql = "from SellDetail as ed where ed.eid='" + cb.getEid()
					+ "' and ed.gid='" + cbd.getGid() + "'";
			SellDetail sd = ((List<SellDetail>) db.getInfo(hql)).get(0); // �õ���Ӧ��������ϸ����
			String url = "/modifyconsumerback.jsp"; // ��ת��ַ
			if (sd.getEdamount() + cbd.getCbdamount() >= cbdamount) {
				cbd.setCbdamount(cbdamount);
				dbup.updateTable("ConsumerBackDetail", cbd, cbdid);
				String cbdtemp = "from ConsumerBackDetail as cbd where cbd.cbid='"
						+ cb.getCbid() + "'"; // ���������hql
				List<ConsumerBackDetail> li = (List<ConsumerBackDetail>) db
						.getInfo(cbdtemp); // �õ������б�
				request.setAttribute("cb", cb); // ������ŵ�������
				request.setAttribute("list", li); // �������б����������
			} else {
				url = "/info.jsp"; // ��תҳ��
				String msg = "�˻�����������������,����˻���Ϊ:"
						+ (sd.getEdamount() + cbd.getCbdamount()); // ��ʾ��Ϣ
				request.setAttribute("msg", msg); // ����Ϣ����������
			}
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("deleteConsumerBackDetail")) {
			String cbdid = request.getParameter("cbdid").trim();
			String cbid = request.getParameter("cbid").trim();
			ConsumerBackDetail cbd = (ConsumerBackDetail) db.getObject(
					"ConsumerBackDetail", cbdid);
			dbde.deleteTable("ConsumerBackDetail", cbdid);
			ConsumerBack cb = (ConsumerBack) db.getObject("ConsumerBack", cbid);
			String cbdtemp = "from ConsumerBackDetail as cbd where cbd.cbid='"
					+ cbid + "'"; // ���������hql
			List<ConsumerBackDetail> li = (List<ConsumerBackDetail>) db
					.getInfo(cbdtemp); // �õ������б�
			request.setAttribute("cb", cb); // ������ŵ�������
			request.setAttribute("list", li); // �������б����������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc
					.getRequestDispatcher("/modifyconsumerback.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("modifyProviderBackDetail")) {
			String pbdid = request.getParameter("pbdid").trim(); // �õ��˻���ϸID
			String amount = request.getParameter("pbdamount").trim(); // �õ��޸ĺ�����
			int pbdamount = Integer.parseInt(amount); // ��������ת��
			ProviderBackDetail pbd = (ProviderBackDetail) db.getObject(
					"ProviderBackDetail", pbdid); // �õ���ϸ����
			ProviderBack pb = (ProviderBack) db.getObject("ProviderBack", pbd
					.getPbid());// �õ��˻�������
			String hql = "from StockDetail as sd where sd.sid='" + pb.getSid()
					+ "' and sd.gid='" + pbd.getGid() + "'";
			StockDetail sd = ((List<StockDetail>) db.getInfo(hql)).get(0); // �õ���Ӧ��������ϸ����
			String url = "/modifyproviderback.jsp"; // ��ת��ַ
			if (sd.getSdamount() + pbd.getPbdamount() >= pbdamount) {
				pbd.setPbdamount(pbdamount);
				dbup.updateTable("ProviderBackDetail", pbd, pbdid);
				String pbdtemp = "from ProviderBackDetail as pbd where pbd.pbid='"
						+ pb.getPbid() + "'"; // ���������hql
				List<ProviderBackDetail> li = (List<ProviderBackDetail>) db
						.getInfo(pbdtemp); // �õ������б�
				request.setAttribute("pb", pb); // ������ŵ�������
				request.setAttribute("list", li); // �������б����������
			} else {
				url = "/info.jsp"; // ��תҳ��
				String msg = "�˻����������ɹ�����,����˻���Ϊ:"
						+ (sd.getSdamount() + pbd.getPbdamount()); // ��ʾ��Ϣ
				request.setAttribute("msg", msg); // ����Ϣ����������
			}
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("deleteProviderBackDetail")) {
			String pbdid = request.getParameter("pbdid").trim(); // �õ�Ҫɾ������ϸID
			String pbid = request.getParameter("pbid").trim(); // �õ��ɹ�ID
			ProviderBackDetail pbd = (ProviderBackDetail) db.getObject(
					"ProviderBackDetail", pbdid);// �õ���ϸ����
			dbde.deleteTable("ProviderBackDetail", pbdid); // ɾ������
			ProviderBack pb = (ProviderBack) db.getObject("ProviderBack", pbid); // �õ��ɹ�����
			String pbdtemp = "from ProviderBackDetail as pbd where pbd.pbid='"
					+ pbid + "'"; // ���������hql
			List<ProviderBackDetail> li = (List<ProviderBackDetail>) db
					.getInfo(pbdtemp); // �õ������б�
			request.setAttribute("pb", pb); // ������ŵ�������
			request.setAttribute("list", li); // �������б����������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc
					.getRequestDispatcher("/modifyproviderback.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("deleteProviderBack")) {
			String pbid = request.getParameter("pbid").trim(); // �õ�Ҫɾ�����˻���ID
			dbde.deleteTable("ProviderBack", pbid);
			int totalPage = db.getTotalPage(userBean.getPageHql(), userBean
					.getSpan());
			userBean.setNowPage(1); // ���õ�ǰҳΪ��һҳ
			userBean.setTotalPage(totalPage); // ��ס��ǰ��ҳ��
			List list = db.getPageContent(userBean.getHql(), userBean
					.getNowPage(), userBean.getSpan()); // �õ��б�
			request.setAttribute("goodslist", list); // ���б�ŵ�������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc
					.getRequestDispatcher("/providerbackmanage.jsp");
			rd.forward(request, response); // ҳ����ת
		} else if (action.equals("deleteConsumerBack")) {
			String cbid = request.getParameter("cbid").trim(); // �õ�Ҫɾ�����˻���ID
			dbde.deleteTable("ConsumerBack", cbid);
			int totalPage = db.getTotalPage(userBean.getPageHql(), userBean
					.getSpan());
			userBean.setNowPage(1); // ���õ�ǰҳΪ��һҳ
			userBean.setTotalPage(totalPage); // ��ס��ǰ��ҳ��
			List list = db.getPageContent(userBean.getHql(), userBean
					.getNowPage(), userBean.getSpan()); // �õ��б�
			request.setAttribute("goodslist", list); // ���б�ŵ�������
			ServletContext sc = getServletContext(); // �õ�������
			RequestDispatcher rd = sc
					.getRequestDispatcher("/consumerbackmanage.jsp");
			rd.forward(request, response); // ҳ����ת
		}
	}
}