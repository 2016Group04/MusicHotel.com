package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.po.UserLike;
@Repository
public interface UserLikeDao {

	//添加一条用户喜爱记录
	public int addUserLike(UserLike userLike);
	
	//根据id删除一条用户喜爱记录
	public int deleteUserLike(int id);
	
	//根据id得到一条用户喜爱记录
	public UserLike getUserLikeById(int id);
	
	//根据sql语句来得到用户喜爱列表
	public List<UserLike> getUserLikeBySql(String sql);
	
	//删除用户喜爱的音乐
	public void deleteUserLikeMusic(int musicId);
}
