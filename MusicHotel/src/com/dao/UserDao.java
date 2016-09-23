package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.po.User;
@Repository
public interface UserDao {
	
	//增加一个用户
	public int addUser(User user);
	
	//删除一个用户
	public int deleteUser(int userId);
	
	//修改用户信息
	public int updateUser(User user);
	
	//根据用户的useId来查找用户
	public User getUserByUserId(int userId);
	
	//根据sql来查找用户
	public List<User> getUserBySql(String sql);
}
