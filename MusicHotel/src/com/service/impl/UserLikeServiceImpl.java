package com.service.impl;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UserLikeDao;
import com.po.UserLike;
import com.service.UserLikeService;
@Service
public class UserLikeServiceImpl implements UserLikeService{

	@Autowired
	private UserLikeDao dao;
	
	@Override
	public void addUserLike(UserLike userLike) {
		int count = dao.addUserLike(userLike);
		
		if(count<1){
			System.out.println("没有添加用户喜爱");
		}else{
			System.out.println("添加一条用户喜爱");
		}
	}

	@Override
	public List<UserLike> getUserLikesByUserId(int userId) {
		
		List<UserLike> list = null;
		
		String sql = "SELECT * FROM user_like WHERE user_id="+userId;
		
		list = dao.getUserLikeBySql(sql);
		return list;
	}
	
	//根据类型和id来得到一个用户喜爱记录
	@Override
	public UserLike getUserLikeByLikeToId(int likeToId,String likeType,int userId){
		
		UserLike userLike = null;
		
		String sql = "SELECT * FROM user_like WHERE like_type='"+likeType+"' AND likeTo_id="+likeToId +" AND user_id="+userId;
		
		List<UserLike> list = dao.getUserLikeBySql(sql);
		System.out.println("userLikeList====="+list);
		System.out.println(list.size());
		if(list==null||list.size()<1){
			
		}else{
		userLike = list.get(0);
		}
		return userLike;
	}
	
	//根据id删除一条用户喜爱记录
	@Override
	public void deleteUserLike(int id){
		
		int count = dao.deleteUserLike(id);
		
		
		if(count<1){
			System.out.println("没有删除任何用户喜爱记录");
		}else{
			System.out.println("删除一条用户喜爱记录");
		}
	}
	
	//根据musicId来删除用户喜爱的已删除的歌曲
	@Override
	public void deleteUserLikeByList(List<Integer> list){
		
		Iterator<Integer> i = list.iterator();
		
		while(i.hasNext()){
			
			Integer musicId = i.next();
			
			dao.deleteUserLikeMusic(musicId);
		}
	}

}
