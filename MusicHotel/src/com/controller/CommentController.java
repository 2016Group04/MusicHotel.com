/**

 * 单位：山东师范大学
 * 姓名：王明新
 * 时间：2016年9月25日上午9:47:24
 * 功能：CommentController.java	
 */
package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.po.Comment;
import com.service.CommentService;

@Controller
public class CommentController {
	@Autowired
	private CommentService commentServiceImpl;
	
	private static final Log log = LogFactory.getLog(CommentController.class);
	
	@RequestMapping("/JSP/addComment")
	public void addComment(HttpServletRequest request,HttpServletResponse response)
			throws IOException,ServletException{
		System.out.println("in addComment");
		request.setCharacterEncoding("UTF-8");
		String target = "";
		//填充数据
		String topicType = request.getParameter("topicType");
		String topicId = request.getParameter("topicId");
		String fromUid = request.getParameter("fromUid");
		
		
		//显示当前时间
		java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat(  
			     "yyyy-MM-dd HH:mm:ss");  
			   java.util.Date currentTime = new java.util.Date();  
		String commentDate = simpleDateFormat.format(currentTime).toString();
		
		String content = request.getParameter("content");
		
		Comment comment = new Comment();
		comment.setTopicType(topicType);
		comment.setTopicId(Integer.valueOf(topicId));
		comment.setFromUid(Integer.valueOf(fromUid));
		comment.setCommentDate(commentDate);
		comment.setContent(content);
		
		commentServiceImpl.addComment(comment);
		log.info("添加评论成功");
		
		target= "msg.jsp";
		request.setAttribute("msg", "添加评论成功");
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	@RequestMapping("/JSP/getCommentOrderByDate")
	public void getCommentOrderByDate(HttpServletRequest request,HttpServletResponse response,String topicType,String hotelId)
			throws IOException,ServletException{
		System.out.println("in getCommentOrderByDate ");
		request.setCharacterEncoding("UTF-8");
		String target = "";
		//填充数据(hotel 和1 需要从jsp中传值)
		System.out.println("in method");
		List<Comment> list = commentServiceImpl.getCommentOrderByDate(topicType, hotelId);
		System.out.println("in list");
		for(Comment comment:list){
			System.out.println(comment);
		}
		request.setAttribute("list", list);
		target = "oneHotel.jsp";
		request.getRequestDispatcher(target).forward(request, response);
		System.out.println("in getCommentOrderByDate  end");
	}
	@RequestMapping("/JSP/getCommentOrderByLikeSum")
	public void getCommentOrderByLikeSum(HttpServletRequest request,HttpServletResponse response)
			throws IOException,ServletException{
		System.out.println("in getCommentOrderByLikeSum ");
		request.setCharacterEncoding("UTF-8");
		String target = "";
		//填充数据(hotel 和1 需要从jsp中传值)
		
		List<Comment> list = commentServiceImpl.getCommentOrderByLikeSum("hotel", "1");
		
		for(Comment comment:list){
			System.out.println(comment);
		}
		request.setAttribute("list", list);
		target = "oneHotel.jsp";
		request.getRequestDispatcher(target).forward(request, response);
	
	}
	
}
