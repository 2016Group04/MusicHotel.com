package com.controller;
//对验证码进行验证的控制器
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class AuthController {

	/**
	 * 功能：验证用户输入的验证码是否正确
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/JSP/checkAuth.action")
    public void checkAuth(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
    	PrintWriter out = response.getWriter();
    	
		System.out.println("in checkAuth");
		
		String auth = request.getParameter("auth");
		HttpSession session = request.getSession(true);
		String randomCode = (String)session.getAttribute("randomCode");
		
		System.out.println(randomCode);
		System.out.println(auth);
		if(randomCode.toLowerCase().equals(auth.toLowerCase())){
			out.write("1");//正确
		}else{
			out.write("0");//错误
		}
		
		out.flush();
	}
    
}
