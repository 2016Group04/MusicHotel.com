package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.impl.UserServiceImpl;

@Controller
public class DegisteController{
	
	@Autowired
	private UserServiceImpl service;
	
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
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		int count = service.getUserByNickName(account);//1:找到该用户   0：没有找到该用户可以注册
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/text;charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("count================" + count);
		if(count==1){
			out.write("1");
		}else if(count==0){
			out.write("0");
		}
		
		out.flush();
		
	}
	
	@RequestMapping("/JSP/submit.action")
	public void register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("注册啦注册啦");
		
		
	}


}
