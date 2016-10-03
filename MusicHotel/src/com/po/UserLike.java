package com.po;

import java.util.Date;

public class UserLike {

	
	/*id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,				#用户编号
	like_type VARCHAR(10),		#被点赞的对象类型  对hotel、article  或者是对评论 点赞
	likeTo_id INT,				#被点赞的对象的id
	like_date DATETIME			#点赞的时间*/
	
	private int id;
	private int userId;
	private String likeType;
	private int likeToId;
	private Date likeDate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getLikeType() {
		return likeType;
	}
	public void setLikeType(String likeType) {
		this.likeType = likeType;
	}
	public int getLikeToId() {
		return likeToId;
	}
	public void setLikeToId(int likeToId) {
		this.likeToId = likeToId;
	}
	public Date getLikeDate() {
		return likeDate;
	}
	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}
	@Override
	public String toString() {
		return "UserLike [id=" + id + ", userId=" + userId + ", likeType="
				+ likeType + ", likeToId=" + likeToId + "]";
	}
	
	
}
