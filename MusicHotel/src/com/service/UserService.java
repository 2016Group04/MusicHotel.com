package com.service;

import java.util.List;

import com.po.User;

public interface UserService {
	
	
	//添加一个用户
	public int addUser(User user);
	
	//删除一个用户
	public int deleteUser(int userId);
	
	//更新一个用户
	public int updateUser(User user);
	
	//根据用户的userId来查找一个用户
	public User getUserByUserId(int userId);
	
	//使用用户的昵称来查找是否存在该用户
	public int getUserByNickName(String account);
	
}
