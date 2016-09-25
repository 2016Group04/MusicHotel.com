/**

 * 单位：山东师范大学
 * 姓名：王明新
 * 时间：2016年9月23日下午2:39:30
 * 功能：CommentDaoImpl.java	
 */
package com.dao.impl;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.dao.CommentDao;
import com.po.Comment;

public class CommentDaoImpl implements CommentDao {

	private SqlSession session;
	public SqlSession getSession() {
		return session;
	}
	public void setSession(SqlSession session) {
		System.out.println("使用set方法把session注入到CommentDaoImpl对象");
		this.session = session;
	}

	public CommentDaoImpl() {
		System.out.println("创建了一个CommentDaoImpl对象");
	}

	@Override
	public int addComment(Comment comment) {

		String statement = "com.po.commentMapper.addComment";

		int count = session.insert(statement, comment);
		if(count>=1){
			System.out.println("添加成功！");
		}else{
			System.out.println("添加失败！");
		}
		return count;
	}

	@Override
	public int deleteCommentByCommentId(int commentId) {
		String statement = "com.po.commentMapper.deleteCommentByCommentId";
		int count = session.insert(statement, commentId);
		if(count>=1){
			System.out.println("删除成功！");
		}else{
			System.out.println("删除失败！");
		}
		return count;
	}

	@Override
	public int updateComment(Comment comment) {

		return 0;
	}

	@Override
	public Comment getCommentById(String commentId) {

		return null;
	}

	

	@Override
	public List<Comment> getCommentBySql(String sql) {

		return null;
	}

	public static void main(String[] args) {
		CommentDaoImpl c = new CommentDaoImpl();
		Comment comment = new Comment();
		comment.setFromUid(1);
		comment.setToCid(0);
		comment.setTopicId(1);
		comment.setContent("HelloWorld");
		comment.setTopicType("hotel");
		comment.setCommentDate("2016-09-23 12:45:12");
		
		ApplicationContext context = new FileSystemXmlApplicationContext("WebRoot/WEB-INF/applicationContext.xml");
		
		c = (CommentDaoImpl)context.getBean("commentDaoImpl");
		/*c.deleteCommentByCommentId(4);*/
		c.addComment(comment);
	}
}
