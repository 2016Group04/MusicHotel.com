package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UserDao;
import com.po.User;
import com.service.UserService;
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao dao;

	/**
	 * 功能：添加一个用户，完成用户的注册
	 */
	@Override
	public int addUser(User user) {
		
		int count = dao.addUser(user);
		
		return count;
	}

	@Override
	public int deleteUser(int userId) {
		
		int count = dao.deleteUser(userId);
		return count;
	}

	@Override
	public int updateUser(User user) {
		
		int count = dao.updateUser(user);
		return count;
	}

	@Override
	public User getUserByUserId(int userId) {
		
		User user = null;
		user = dao.getUserByUserId(userId);
		return user;
	}

	@Override
	public int getUserByNickName(String account) {
		
		String sql = "SELECT * FROM users WHERE nickname='" + account + "'";
		
		List<User> list = dao.getUserBySql(sql);
				
		int count = 0;
		if(list.size()>=1){
			count = 1;//找到该用户
		}else{
			count = 0;//没有这个用户
		}
				
		return count;
	}


	
	
}
