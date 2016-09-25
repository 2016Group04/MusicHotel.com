package com.dao;

import java.util.LinkedList;

import org.springframework.stereotype.Repository;

import com.po.Notification;
@Repository
public interface NotificationDao {

	//添加一条系统消息
	public int addNotification(Notification notification);
	
	//得到所有的系统消息
	public LinkedList<Notification> getAllNotification();
	
}
