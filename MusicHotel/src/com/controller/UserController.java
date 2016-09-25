package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.po.User;
import com.service.impl.UserServiceImpl;


@Controller
public class UserController {
	
	@Autowired
	private UserServiceImpl service;
	
	@RequestMapping("/JSP/getMyInfo.action")
    public void getMyInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
    	
		System.out.println("in getMyInfo");
	
		Integer userId = Integer.parseInt(request.getParameter("userId"));
		
		User user = service.getUserByUserId(userId);
		
		request.setAttribute("user", user);
		request.getRequestDispatcher("/jsp/setting.jsp").forward(request, response);
	}
}
