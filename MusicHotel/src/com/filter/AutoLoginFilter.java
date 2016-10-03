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

import com.po.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;
import com.util.MD5;

public class AutoLoginFilter implements Filter{

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
			}else{
				
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
					String passwordMD5 = values[2];
					//判断cookie是否失效
					if(Long.valueOf(time)<=System.currentTimeMillis()){
						
						chain.doFilter(request, response);
					}
					
					//没有失效
					UserService service = new UserServiceImpl();
					
					User user = service.getUserByEmail(email);
					
					//判断用户是否为空
					if(user==null){//为空，继续执行
						
						chain.doFilter(request, response);
						return;
					}
					
					String userValue = user.getEmail() + ":" + time + ":" + user.getPasswordMD5();
					
					
				}
				
				
				
			}
			
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
		
	}

	
}
