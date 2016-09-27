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
	public User getUserByNickName(String account) {
		
		User user = null;
		String sql = "SELECT * FROM users WHERE nickname='" + account + "'";
		
		List<User> list = dao.getUserBySql(sql);
				
		int count = 0;
		if(list.size()>=1){
			user = list.get(0);//找到该用户
		}
				
		return user;
	}


	//使用用户的邮箱来查找是否存在该用户
		public User getUserByEmail(String email){
			
			User user = null;
			String sql = "SELECT * FROM users WHERE email='" + email + "'";
			List<User> list = dao.getUserBySql(sql);
			int count = 0;
			if(list.size()>=1){
				user = list.get(0);//找到该用户
			}
					
			return user;
		}
		
		//用户登录的时候验证用户的邮箱和密码
		public User checkLogin(String email,String password){
			
			String sql = "SELECT * FROM users WHERE email='" + email + "' and password_MD5='" + password + "'";
			
			List<User> list = dao.getUserBySql(sql);
					
			User user = null;
			if(list.size()>=1){
				user = list.get(0);//找到该用户
			}
					
			return user;
		}
		
}
