package com.po;

import java.util.Date;

//msg  消息表
public class Msg {

	/*id INT PRIMARY KEY AUTO_INCREMENT,
	topic_type VARCHAR(10),		#消息的类型 点赞消息  评论消息
	topic_id INT,				#消息对应类型的编号   如评论编号  点赞编号
	msg_date DATETIME			#消息时间*/
	
	private int id;
	private String topicType;
	private int topicId;
	private Date msgDate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTopicType() {
		return topicType;
	}
	public void setTopicType(String topicType) {
		this.topicType = topicType;
	}
	public int getTopicId() {
		return topicId;
	}
	public void setTopicId(int topicId) {
		this.topicId = topicId;
	}
	public Date getMsgDate() {
		return msgDate;
	}
	public void setMsgDate(Date msgDate) {
		this.msgDate = msgDate;
	}
	@Override
	public String toString() {
		return "Msg [id=" + id + ", topicType=" + topicType + ", topicId="
				+ topicId + ", msgDate=" + msgDate + "]";
	}
	
	
	
}
