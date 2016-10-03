package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.po.User;
import com.service.impl.UserServiceImpl;


@Controller
public class UserController {
	
	@Autowired
	private UserServiceImpl service;
	
	private static final Log log = LogFactory.getLog(UserController.class);
	
	@RequestMapping("/JSP/getMyInfo.action")
    public void getMyInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
    	
		log.info("in getMyInfo");
	
		Integer userId = Integer.parseInt(request.getParameter("userId"));
		
		User user = service.getUserByUserId(userId);
		
		request.setAttribute("user", user);
		request.getRequestDispatcher("/JSP/setting.jsp").forward(request, response);
	}
	
	@RequestMapping("/JSP/updateUserProfileText.action")
	public void updateUserProfileText(HttpServletResponse response,HttpServletRequest request,int userId,String profileContent){
		
		System.out.println("in updateUserProfileText");
		
		User user = service.getUserByUserId(userId);
		user.setProfileText(profileContent);
		
		HttpSession session = request.getSession(true);
		session.setAttribute("user", user);
		service.updateUser(user);
		
		
	}
	
	
	@RequestMapping("/JSP/listenedSumAddOne.action")
	public void listenedSumAddOne(HttpServletResponse response,int userId){
		
		System.out.println("in listenedSumAddOne");
		
		User user = service.getUserByUserId(userId);
		int sum = user.getListenedSum();
		user.setListenedSum(sum + 1);
		
		service.updateUser(user);
		
		
	}
}
