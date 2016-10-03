package com.service;

import java.util.List;

import com.po.UserLike;

public interface UserLikeService {

	//添加一条用户喜爱记录
	public void addUserLike(UserLike userLike);
	
	//根据id删除一条用户喜爱记录
	public void deleteUserLike(int id);
	
	//根据用户id来得到用户喜爱的列表
	public List<UserLike> getUserLikesByUserId(int userId);
	
	//根据类型和id来得到一个用户喜爱记录
	public UserLike getUserLikeByLikeToId(int likeToId,String likeType);
}
