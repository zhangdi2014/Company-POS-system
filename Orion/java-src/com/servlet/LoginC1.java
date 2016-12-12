package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.Session;

/**
 * Servlet implementation class LoginC1
 */
@WebServlet("/LoginC1")
public class LoginC1 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		//获取验证码
		String checkCode=request.getParameter("checkcode");
		
		//取出session中的验证码
		String checkCode2=(String) request.getSession().getAttribute("checkcode");
		
		//先验证码
		if(checkCode.equals(checkCode2)){
			request.getRequestDispatcher("/ManageServlet").forward(request,response);
		}else{
				response.sendRedirect("/Orion/adminlogin.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
