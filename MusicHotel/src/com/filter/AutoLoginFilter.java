package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.po.User;
import com.service.impl.UserServiceImpl;
import com.util.MD5;

@Component
public class AutoLoginFilter implements Filter{

	@Autowired
	private UserServiceImpl service;

	
	@Override
	public void destroy() {
		
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		
		//将不带Http的转换成带Http的
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		
		//判断cookie中是否存在autoLogin的cookie对象
		Cookie autoCookie = null;
		
		Cookie[] cookies = request.getCookies();
		if(cookies!=null){
			
			for(Cookie cookie:cookies){
				
				//判断cookies中是否存在autoLogin的cookie对象
				if("autoLogin".equals(cookie.getName())){
					autoCookie = cookie;
				}
			}
			
			//判断autoLogin cookie是不是空
			if(autoCookie==null){
				
				chain.doFilter(request, response);
				return;
			}
				
				//如果autoCookie不为空的话。判断cookie中的值
				
				//得到cookie中的值
				String value = autoCookie.getValue();
				String[] values = value.split(":");
				
				if(values.length!=3){
					chain.doFilter(request, response);
				}else{
					
					
					//得到拆分的值
					String email = values[0];
					String time = values[1];
					String valueMD5 = values[2];
					//判断cookie是否失效
					if(Long.valueOf(time)<=System.currentTimeMillis()){
						
						chain.doFilter(request, response);
					}
					
					//没有失效
					System.out.println("service======="+service);
					User user = service.getUserByEmail(email);
					
					//判断用户是否为空
					if(user==null){//为空，继续执行
						
						chain.doFilter(request, response);
						return;
					}
					
					String userValue = user.getEmail() + ":" + time + ":" + user.getPasswordMD5();
					//加密之后和cookie中的值进行对比
					if(!valueMD5.equals(MD5.getHash(userValue))){
						//不一样的话继续执行原来的页面
						chain.doFilter(request, response);
						return;
					}
					System.out.println("user==========");
					HttpSession session = request.getSession();
					session.setAttribute("user", user);
					
				}
				
				
		}else{
			System.out.println("**************filter~~~");
			chain.doFilter(request, response);
			return;
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
		
	}

	
}
