package com.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
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
	 * 功能：检查用户的邮箱是否已被注册
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/JSP/checkEmail.action")
	public void checkEmail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("检查邮箱是否存在spring mvc");
		
		String email = request.getParameter("email");
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		int count = service.getUserByEmail(email);//1:找到该用户   0：没有找到该用户可以注册
		
		
		PrintWriter out = response.getWriter();
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
		Date date = new Date();
		
		user.setSignupDate(date);
		
		String passwordMD5 = MD5.getHash(password);
		user.setPasswordMD5(passwordMD5);
		//注册成功
		int count = service.addUser(user);
		
		HttpSession session = request.getSession(true);
		//将当前用户放在session中
		session.setAttribute("user", user);
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
			PrintWriter out = response.getWriter();
			out.write("1");
			out.flush();
			
		}
		
	}
	
	/**
	 * 功能：用户登录时，验证用户的邮箱和密码是否正确
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("JSP/checkLogin.action")
	public void checkLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("in checkLogin");
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		String passwordMD5 = MD5.getHash(password);
		
		User user = service.checkLogin(email, passwordMD5);
		
		PrintWriter out = response.getWriter();
		if(user!=null){
			out.write("1");//找到该用户，可以登录
		}else if(user==null){
			out.write("0");//没有找到该用户，用户民或密码错误
		}
		
		out.flush();
	}
	
	/**
	 * 功能：用户登录成功，返回用户相关的信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("JSP/login.action")
	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("in login");
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		String passwordMD5 = MD5.getHash(password);
		
		User user = service.checkLogin(email, passwordMD5);
		
		String nickname = user.getNickname();
		String profileImg = user.getProfileImg();
		
		HttpSession session = request.getSession(true);
		//将当前用户放在session中
		session.setAttribute("user", user);
		
		Gson gson = new Gson();
		
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("nickname", nickname);
		map.put("profileImg", profileImg);
		
		
		//得到相应的用户消息，放到map中，然后转换成json
		String s = gson.toJson(map);
		
		System.out.println(s);
		PrintWriter out = response.getWriter();
		out.write(s);
		out.flush();
	}
	
	/**
	 * 功能：用户登出
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("JSP/logout.action")
	public void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("in logout");
		
		HttpSession session = request.getSession(true);
		session.invalidate();
		
		String target = "allHotels.html";
		request.getRequestDispatcher(target).forward(request, response);
	}
	

}
