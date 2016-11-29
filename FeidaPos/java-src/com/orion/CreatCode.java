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
		//禁止浏览器缓存随机图片
		response.setDateHeader("Expices", -1);
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		
		//通知客户端以图片方式打开发送过去的数据
		response.setHeader("Content-Type", "image/jpeg");
		
		//在内存中创建一副图片
		BufferedImage image=new BufferedImage(60,25,BufferedImage.TYPE_INT_RGB);
		
		//向图片上写数据
		Graphics g=image.getGraphics();
		
		//设背景色
	    g.setColor(Color.BLACK);
	    g.fillRect(0, 0, 60, 25);
		
	    
	    //设置写入数据的颜色和字体
	    g.setColor(Color.RED);
	    g.setFont(new Font(null, Font.BOLD, 20));
	    
	    //向图片上写数据
	    String num= makeNum();
	    
	    //把随机生成的数据保存到session
	    request.getSession().setAttribute("checkcode", num);
	    g.drawString(num, 0, 20);
	    
	    //把写好的数据输出给浏览器
	    ImageIO.write(image,"jpg",response.getOutputStream());
	    
		
				
	}
	
	//该函数随机生成数字

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
