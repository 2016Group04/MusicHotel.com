package com.service.impl;

import java.util.LinkedList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MsgDao;
import com.po.Msg;
import com.service.MsgService;

@Service
public class MsgServiceImpl implements MsgService{

	@Autowired
	private MsgDao dao;

	@Override
	public int addMsg(Msg msg) {
		
		int count = dao.addMsg(msg);
		return count;
	}

	@Override
	public LinkedList<Msg> getAllMsg(int userId) {
		
		LinkedList<Msg> list = null;
		list = dao.getAllMsg(userId);
		
		return list;
	}
	
	
}
