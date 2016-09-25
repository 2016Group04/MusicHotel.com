package com.dao;

import java.util.LinkedList;

import org.springframework.stereotype.Repository;

import com.po.Msg;
@Repository
public interface MsgDao {

	//添加一条消息
	public int addMsg(Msg msg);
	
	//得到所有的消息
	public LinkedList<Msg> getAllMsg(int userId);
}
