package com.orion;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreatCode
 */
@WebServlet("/CreatCode")
public class CreatCode extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//��ֹ������������ͼƬ
		response.setDateHeader("Expices", -1);
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		
		//֪ͨ�ͻ�����ͼƬ��ʽ�򿪷��͹�ȥ������
		response.setHeader("Content-Type", "image/jpeg");
		
		//���ڴ��д���һ��ͼƬ
		BufferedImage image=new BufferedImage(60,25,BufferedImage.TYPE_INT_RGB);
		
		//��ͼƬ��д����
		Graphics g=image.getGraphics();
		
		//�豳��ɫ
	    g.setColor(Color.BLACK);
	    g.fillRect(0, 0, 60, 25);
		
	    
	    //����д�����ݵ���ɫ������
	    g.setColor(Color.RED);
	    g.setFont(new Font(null, Font.BOLD, 20));
	    
	    //��ͼƬ��д����
	    String num= makeNum();
	    
	    //��������ɵ����ݱ��浽session
	    request.getSession().setAttribute("checkcode", num);
	    g.drawString(num, 0, 20);
	    
	    //��д�õ���������������
	    ImageIO.write(image,"jpg",response.getOutputStream());
	    
		
				
	}
	
	//�ú��������������

	private String makeNum() {
		// TODO Auto-generated method stub
		
		Random r=new Random();
		String num=r.nextInt(9999)+"";
		StringBuffer sb=new StringBuffer();
		for(int i=0;i<4-num.length();i++){
			sb.append("0");
		}
		num=sb.toString()+num;
		return num;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
