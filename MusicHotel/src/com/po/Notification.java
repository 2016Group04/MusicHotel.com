package com.po;

import java.util.Date;

public class Notification {

	/*id INT PRIMARY KEY AUTO_INCREMENT,
	notification_date DATETIME,	#通知时间
	title VARCHAR(60),			#通知标题
	content VARCHAR(600)*/
	
	private int id;
	private Date notificationDate;
	private String title;
	private String content;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getNotificationDate() {
		return notificationDate;
	}
	public void setNotificationDate(Date notificationDate) {
		this.notificationDate = notificationDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String titile) {
		this.title = titile;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Notification [id=" + id + ", notificationDate="
				+ notificationDate + ", titile=" + title + ", content="
				+ content + "]";
	}
	
	
	
}
