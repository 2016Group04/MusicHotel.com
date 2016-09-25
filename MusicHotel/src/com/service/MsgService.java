package com.service;

import java.util.LinkedList;

import com.po.Msg;

public interface MsgService {

	//添加一条消息
	public int addMsg(Msg msg);
	
	//查询所有的消息
	public LinkedList<Msg> getAllMsg(int userId);
}
