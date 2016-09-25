package com.service;

import java.util.LinkedList;

import com.po.Notification;

public interface NotificationService {

	//添加一条系统通知
	public int addNotification(Notification notification);
	
	//查询所有的系统通知
	public LinkedList<Notification> getAllNotification();
}
