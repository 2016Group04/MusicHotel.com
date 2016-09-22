package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.UserService;

@Controller
public class DegisteController{
	
	
	private UserService service;
	
	public DegisteController(){
		
	}
	
	public void setService(UserService service){
		this.service = service;
	}
	/**
	 * 功能：验证用户注册时输入的昵称是否存在
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/JSP/checkAccount.action")
	public void checkAccount(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("检查昵称是否存在spring mvc");
		
		String account = request.getParameter("account");
		System.out.println("service=====" + service);
		
		int count = service.getUserByNickName(account);//1:找到该用户   0：没有找到该用户可以注册
		
		PrintWriter out = response.getWriter();
		
		out.write(count);
		out.flush();
		
	}

}
