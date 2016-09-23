/**

 * 单位：山东师范大学
 * 姓名：王明新
 * 时间：2016年9月23日上午10:38:22
 * 功能：Comment.java	
 */
package com.po;

import java.util.Date;


public class Comment {
	private int commentId ;
	private String topicType; //	被评论的主题的类型  对hotel评论或对article评论
	private int topicId; 			//被评论主题的编号(hotel_id或者是article_id)
	private int toCid ;			//to_cid代表评论了 哪条评论（对他人的评论进行评论）to_comment_id
	private int fromUid ;			//来自哪个用户的评论  uid即user_id
	private Date commentDate;// DATETIME,	评论日期
	private String content; 	//评论内容
	private int likeSum;			//该条评论被喜欢的总数
	private int isReported;//0是否被举报  0--没有被举报  1---被举报
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
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
	public int getToCid() {
		return toCid;
	}
	public void setToCid(int toCid) {
		this.toCid = toCid;
	}
	public int getFromUid() {
		return fromUid;
	}
	public void setFromUid(int fromUid) {
		this.fromUid = fromUid;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getLikeSum() {
		return likeSum;
	}
	public void setLikeSum(int likeSum) {
		this.likeSum = likeSum;
	}
	public int getIsReported() {
		return isReported;
	}
	public void setIsReported(int isReported) {
		this.isReported = isReported;
	}
	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", topicType=" + topicType
				+ ", topicId=" + topicId + ", toCid=" + toCid + ", fromUid="
				+ fromUid + ", commentDate=" + commentDate + ", content="
				+ content + ", likeSum=" + likeSum + ", isReported="
				+ isReported + "]";
	}
	
	
}
