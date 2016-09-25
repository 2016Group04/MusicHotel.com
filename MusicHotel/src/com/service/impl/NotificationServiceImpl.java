package com.service.impl;

import java.util.LinkedList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.NotificationDao;
import com.po.Notification;
import com.service.NotificationService;

@Service
public class NotificationServiceImpl implements NotificationService{

	@Autowired
	private NotificationDao dao;

	@Override
	public int addNotification(Notification notification) {
		
		int count = dao.addNotification(notification);
		return count;
	}

	@Override
	public LinkedList<Notification> getAllNotification() {
		
		LinkedList<Notification> list = null;
		list = dao.getAllNotification();
		
		return list;
	}
	
	
}
