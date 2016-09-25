/**

 * 单位：山东师范大学
 * 姓名：王明新
 * 时间：2016年9月24日下午5:57:14
 * 功能：CommentService.java	
 */
package com.service;

import java.util.List;

import com.po.Comment;


public interface CommentService {
	//增
	public void addComment(Comment comment);
	
	//查最新评论
	public List<Comment> getCommentOrderByDate(String topicType ,String topicId);
	
	//查最热评论
	public List<Comment> getCommentOrderByLikeSum(String topicType ,String topicId);
	
	//查一
	public Comment getCommentById(String commentId);
	
	
}
