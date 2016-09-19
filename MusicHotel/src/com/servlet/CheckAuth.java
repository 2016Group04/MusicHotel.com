package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckAuth extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    	
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
    	String action = request.getParameter("action");
    	if("checkAuth".equals(action)){
    		this.checkAuth(request,response);
    	}
    }
    
    public void checkAuth(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

    	PrintWriter out = response.getWriter();
    	
		System.out.println("in checkAuth");
		
		String auth = request.getParameter("auth");
		HttpSession session = request.getSession(true);
		String randomCode = (String)session.getAttribute("randomCode");
		
		System.out.println(randomCode);
		System.out.println(auth);
		if(randomCode.toLowerCase().equals(auth.toLowerCase())){
			out.print("正确");
		}else{
			out.print("错误");
		}
		
		out.flush();
	}
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}
}
