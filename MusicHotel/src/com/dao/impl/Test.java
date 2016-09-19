package com.dao.impl;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.po.User;

public class Test {

	public static void main(String[] args) {
		
		ApplicationContext context = new FileSystemXmlApplicationContext("WebRoot/WEB-INF/applicationContext.xml");
		UserDaoImpl userDao = (UserDaoImpl)context.getBean("userDaoImpl");
		
		System.out.println(userDao);
		
		User user = new User();
		user.setNickname("zyy22");
		user.setEmail("zyy0605@sina.com");
		user.setPasswordMD5("12345");
		
		int count = userDao.addUser(user);
		
		System.out.println("1------" + count);
	}
}
