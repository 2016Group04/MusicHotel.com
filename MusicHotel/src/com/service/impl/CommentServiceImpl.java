/**

 * 单位：山东师范大学
 * 姓名：王明新
 * 时间：2016年9月24日下午5:58:42
 * 功能：CommentServiceImpl.java	
 */
package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CommentDao;
import com.po.Comment;
import com.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDao commentDao;
	
	public CommentDao getCommentDao() {
		return commentDao;
	}

	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}

	@Override
	public void addComment(Comment comment) {
		commentDao.addComment(comment);

	}

	
	@Override
	public List<Comment> getCommentOrderByDate(String topicType ,String topicId) {
		
		List<Comment> list = null;
		int tId = Integer.parseInt(topicId);
		String sql = "SELECT * FROM comments WHERE topic_type='" + topicType + "' and topic_id="+tId+" order by comment_date DESC";
		list = commentDao.getCommentBySql(sql);
		System.out.println(list);
		return list;
	}

	
	@Override
	public List<Comment> getCommentOrderByLikeSum(String topicType ,String topicId) {
		List<Comment> list = null;
		int tId = Integer.parseInt(topicId);
		String sql = "SELECT * FROM comments WHERE topic_type='" + topicType + "' and topic_id="+tId+" order by like_sum DESC";
		list = commentDao.getCommentBySql(sql);
		System.out.println(sql);
		System.out.println(list);
		return list;
	}

	
	@Override
	public Comment getCommentById(String commentId) {
		
		return null;
	}

}
