package com.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.UserDao;
import com.po.User;

public class UserDaoImpl implements UserDao {

	private SqlSession session = null;
	
	
	
	public SqlSession getSession() {
		return session;
	}

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public int addUser(User user) {
		
		
		String statement = "com.po.UserMapper.addUser";
		int count = session.insert(statement, user);
		return count;
		
	}

	@Override
	public int deleteUser(int userId) {
		
		String statement = "com.po.UserMapper.deleteUserByUserId";
		
		int count = session.delete(statement,userId);
		return count;
	}

	@Override
	public int updateUser(User user) {
		
		int count = 0;
		
		return count;
	}

	@Override
	public User getUserByUserId(int userId) {

		String statement = "com.po.UserMapper.getUserByUserId";
		
		User user = session.selectOne(statement, userId);
		return user;
		
	}

	@Override
	public List<User> getUserBySql(String sql) {
		
		List<User> list = new ArrayList<User>();
		
		String statement = "com.po.UserMapper.getUserBySql";
		list = session.selectList(statement, sql);
		
		return list;
	}

}
