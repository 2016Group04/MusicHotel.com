package com.controller;
//对用户的登录和注册进行处理的控制器
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.po.Notification;
import com.po.User;
import com.service.impl.JavaMailServiceImpl;
import com.service.impl.MsgServiceImpl;
import com.service.impl.NotificationServiceImpl;
import com.service.impl.UserServiceImpl;
import com.util.MD5;

@Controller
@RequestMapping("/JSP")
public class RegisteController{
	
	@Autowired
	private UserServiceImpl service;
	@Autowired
	private JavaMailServiceImpl mailService;
	
	@Autowired
	private NotificationServiceImpl notificationService;
	
	@Autowired
	private MsgServiceImpl msgService;
	
	private static long expires = 24 * 60 * 60;//时间是：一天
	
	/**
	 * 功能：验证用户注册时输入的昵称是否存在
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/checkAccount.action")
	public void checkAccount(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("检查昵称是否存在spring mvc");
		
		String account = request.getParameter("account");
		System.out.println("service=====" + service);
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		User user = service.getUserByNickName(account);//1:找到该用户   0：没有找到该用户可以注册
		
		
		PrintWriter out = response.getWriter();
	
		if(user!=null){
			out.write("1");
		}else if(user==null){
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
	@RequestMapping("/checkEmail.action")
	public void checkEmail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("检查邮箱是否存在spring mvc");
		
		String email = request.getParameter("email");
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		User user = service.getUserByEmail(email);//1:找到该用户   0：没有找到该用户可以注册
		
		
		PrintWriter out = response.getWriter();
		if(user!=null){
			out.write("1");
		}else if(user==null){
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
	@RequestMapping("/submit.action")
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
		
		user = service.getUserByNickName(nickname);
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
			
			
			PrintWriter out = response.getWriter();
			out.write("1");
			out.flush();
			
			
		}
		
	}
	
	/**
	 * 功能：用户注册之后验证邮箱
	 * @return
	 */
	@RequestMapping("/emailValidation.action")
	public String emailValidation(int userId){
		String target = "";
		
		User user = service.getUserByUserId(userId);
		
		user.setIsValited(1);
		
		service.updateUser(user);
		
		target = "/JSP/activationSuccess.jsp";
		return target;
	}
	
	/**
	 * 功能：用户登录时，验证用户的邮箱和密码是否正确
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/checkLogin.action")
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
	@RequestMapping("/login.action")
	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("in login");
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String auto = request.getParameter("auto");
		System.out.println(password);
		String passwordMD5 = MD5.getHash(password);
		
		User user = service.checkLogin(email, passwordMD5);
		
		String nickname = user.getNickname();
		String profileImg = user.getProfileImg();
		System.out.println(auto);
		//实现下次的自动登陆
		if("true".equals(auto)){
			
			System.out.println("in autoLogin");
			
			// 声明cookie  
            Cookie autoCookie = null;  
            // 获取所有cookie  
            Cookie[] cookies = request.getCookies();  
            boolean hasAutologinCookie = false;
            for(Cookie cookie:cookies){
            	
            	//判断是否存在自动登陆的记录
            	if("autoLogin".equals(cookie.getName())){
            		
            		hasAutologinCookie = true;
            		autoCookie = cookie;
            		
            		//cookie存在，需要重新进行赋值
            		long time = (System.currentTimeMillis() + expires );
            		//cookie拼接的value值
            		
            		String cookieValue = email + ":" +time + ":" + MD5.getHash(email + ":" + time + ":" + passwordMD5);
            		
            		autoCookie.setValue(cookieValue);
            	}
            }
            
            if(!hasAutologinCookie){
            	
            	long time = System.currentTimeMillis() + expires * 7;
            	
            	String cookieValue = email + ":" + time + ":" + MD5.getHash(email + ":" + time + ":" + passwordMD5);
            	
            	autoCookie = new Cookie("autoLogin", cookieValue); 
            }
            
            autoCookie.setMaxAge((int)expires);
            autoCookie.setPath("/MusicHotel/");
            response.addCookie(autoCookie);
            
		}
		
		HttpSession session = request.getSession(true);
		//将当前用户放在session中
		session.setAttribute("user", user);
		
		Gson gson = new Gson();
		
		
		Map<String,Object> map = new LinkedHashMap<String,Object>();
		
		map.put("nickname", nickname);
		map.put("profileImg", profileImg);
		
		/*//得到所有的系统通知
		List<Notification> listNotification = notificationService.getAllNotification();
		
		List<Msg> listMsg = msgService.getAllMsg(user.getUserId());
		
		map.put("notification", listNotification);
		map.put("msg", listMsg);*/
		
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
	@RequestMapping("/logout.action")
	public String logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("in logout");
		
		HttpSession session = request.getSession(true);
		session.invalidate();
		
		//将用户自动登录的cookie删除
		Cookie cookie = getAutoLoginCookie(request);
		
		System.out.println(cookie!=null);
		
		if(cookie!=null){
			
			//存在自动登录的cookie,删除
			cookie.setMaxAge(0);
			cookie.setPath("/MusicHotel/");
			response.addCookie(cookie);
		}
		
		String target = "redirect:/JSP/firstPage.jsp";
		return target;
	}
	
	/**
	 * 功能:检查是不是自动登录
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/check.action")
	public void checkAutoLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Cookie autoCookie = null;
		
		System.out.println("in checkAutoLogin");
		Cookie[] cookies = request.getCookies();
		if(cookies!=null){
			
			for(Cookie cookie:cookies){
				
				//判断cookies中是否存在autoLogin的cookie对象
				if("autoLogin".equals(cookie.getName())){
					autoCookie = cookie;
				}
			}
			System.out.println("cookie");
			//判断autoLogin cookie是不是空
			if(autoCookie!=null){	
				
				//如果autoCookie不为空的话。判断cookie中的值
				
				//得到cookie中的值
				System.out.println("111");
				String value = autoCookie.getValue();
				String[] values = value.split(":");
				
				if(values.length==3){
				
					
					
					//得到拆分的值
					String email = values[0];
					String time = values[1];
					String valueMD5 = values[2];
					//判断cookie是否失效
					System.out.println("222");
					if(Long.valueOf(time)>System.currentTimeMillis()){
						
					//没有失效
					System.out.println("service======="+service);
					User user = service.getUserByEmail(email);					
					//判断用户是否为空
					if(user!=null){//为空，继续执行
					
					String userValue = user.getEmail() + ":" + time + ":" + user.getPasswordMD5();
					//加密之后和cookie中的值进行对比
						if(valueMD5.equals(MD5.getHash(userValue))){
							//不一样的话继续执行原来的页面
							System.out.println("user=========");
							HttpSession session = request.getSession(true);
							session.setAttribute("user", user);
						}
					
					}
					}
				}
				
			}	
		}
		
		System.out.println("this");
		String target = "getHotelByPage.action?requestPage=1";
		
		
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	
	/**
	 * 功能：得到用户相关的消息和通知
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/getAllMessage.action")
	public void getAllMessage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		//返回系统通知
		List<Notification> list = notificationService.getAllNotification();
		
		Iterator<Notification> i = list.iterator();
		
		while(i.hasNext()){
			Notification n = i.next();
			n.setType("系统通知");
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		System.out.println(json);
	
		PrintWriter out = response.getWriter();
		out.write(json);
		out.flush();
	}
	
	
	
	public Cookie getAutoLoginCookie(HttpServletRequest request){
		Cookie autoCookie = null;
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies!=null){
			
			for(Cookie cookie:cookies){
				
				if("autoLogin".equals(cookie.getName())){
					
					autoCookie = cookie;
				}
			}
		}
		
		
		return autoCookie;
	}

}
