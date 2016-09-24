package com.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.po.User;
import com.service.impl.JavaMailServiceImpl;
import com.service.impl.UserServiceImpl;
import com.util.MD5;

@Controller
public class RegisteController{
	
	@Autowired
	private UserServiceImpl service;
	@Autowired
	private JavaMailServiceImpl mailService;
	
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
	/**
	 * 功能：注册用户
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/JSP/submit.action")
	public void register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("注册啦注册啦");
		
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		User user = new User();
		user.setNickname(nickname);
		user.setEmail(email);
		
		
		String passwordMD5 = MD5.getHash(password);
		user.setPasswordMD5(passwordMD5);
		//注册成功
		int count = service.addUser(user);
		
		
		//发送邮件部分
		String from = "271429728qq@sina.com";
		String to = user.getEmail();
		String subject = "请验证邮箱";

		StringBuffer content = new StringBuffer();
		
		String path=request.getSession().getServletContext().getRealPath("/WEB-INF/classes/emailValidation_html.txt");
		
		FileReader file = new FileReader(path);
		BufferedReader br = new BufferedReader(file);
		
		String str = "";
		
		while((str=br.readLine())!=null){
			
			content.append(str);
		}		
		
		String s = content.toString();	
		
		
		String[] contentArr = s.split("\\|");
		s = contentArr[0] + user.getNickname() + contentArr[1] + user.getUserId() +  contentArr[2];
		System.out.println(contentArr[0]);
		System.out.println(contentArr[1]);
		System.out.println(contentArr[2]);
				
		boolean sendMailFlag = mailService.sendTextMail(from, to, subject,s);
		if (sendMailFlag) {
			System.out.println("发送邮件成功");
		} else {
			System.out.println("发送邮件失败");
		}
		
		if(count==1){
			
			//添加成功
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/text;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.write("1");
			out.flush();
			
		}
	
		
	}

}
