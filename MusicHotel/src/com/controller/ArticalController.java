package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.po.Article;
import com.po.User;
import com.service.impl.ArticleServiceImpl;

@Controller
public class ArticalController {

	@Autowired
	private ArticleServiceImpl articleService;
	
	@RequestMapping("/JSP/getMyArticle.action")
	public String getMyArticle(ModelMap model,HttpServletRequest request){
		
		String target = "";
		User user = (User)request.getSession().getAttribute("user");
		
		List<Article> list = articleService.getArticleByUserId(user.getUserId());
		
		model.addAttribute("list",list);
		
		System.out.println("article===="+list);
		
		target = "myHomePageArticle.jsp";
		return target;
		
	}
	
	@RequestMapping("/JSP/deleteMyArticle.action")
	public String deleteMyArticle(int articleId){
		
		String target = "";
		
		articleService.deleteArticle(articleId);
		
		target = "getMyArticle.action";
		return target;
		
	}
}
