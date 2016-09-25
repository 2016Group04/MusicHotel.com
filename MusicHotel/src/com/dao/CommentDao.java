package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.po.Comment;
@Repository
public interface CommentDao {
	
	//增加一条评论
	
	public int addComment(Comment comment);
		
	//删除一条评论（用户自己删除）（后台管理员删除）
	public int deleteCommentByCommentId(int commentId);
	
	//修改点赞和举报（分两种修改）（暂定）
	public int updateComment(Comment comment);
	
	//查一
	public Comment getCommentById(String commentId);
	
	
		
	//根据评论的hotel或者是文章来排序（日期）
	public List<Comment> getCommentBySql(String sql);
}
