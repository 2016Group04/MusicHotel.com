package com.dao.impl;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.service.UserService;

public class Test {

	public static void main(String[] args) {
		
		ApplicationContext context = new FileSystemXmlApplicationContext("WebRoot/WEB-INF/applicationContext.xml");
		
		
		/*User user = new User();
		user.setNickname("zyy22");
		user.setEmail("zyy0605@sina.com");
		user.setPasswordMD5("12345");
		
		int count = userDao.addUser(user);
		*/
		/*int count = userDao.deleteUser(2);
		System.out.println("delete------" + count);*/
		
		/*User user = (User)userDao.getUserByUserId(1);
		System.out.println("getOneUserById" + user);*/
		
		
		
		UserService service = (UserService)context.getBean("userService");
		
		int count = service.getUserByNickName("AndrewJoe");
		System.out.println("count=======" + count);
	}
}
