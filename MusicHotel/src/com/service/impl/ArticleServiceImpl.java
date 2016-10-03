package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ArticleDao;
import com.po.Article;
import com.service.ArticleService;
@Service
public class ArticleServiceImpl implements ArticleService{
	@Autowired
	private ArticleDao dao;

	/**
	 * 功能：添加一个用户，完成用户的注册
	 */
	@Override
	public int addArticle(Article article) {
		
		int count = dao.addArticle(article);
		
		return count;
	}

	@Override
	public int deleteArticle(int articleId) {
		
		int count = dao.deleteArticle(articleId);
		return count;
	}

	@Override
	public int updateArticle(Article article) {
		
		int count = dao.updateArticle(article);
		return count;
	}

	@Override
	public Article getArticleByArticleId(int articleId) {
		
		Article article = null;
		article = dao.getArticleByArticleId(articleId);
		return article;
	}

	//根据用户的id来查找用户创建的文章
	@Override
	public int getArticleByQuery(String account) {
	
		String sql = "SELECT * FROM Article WHERE nickname='" + account + "'";
		
		List<Article> list = dao.getArticleBySql(sql);
				
		int count = 0;
		if(list.size()>=1){
			count = 1;//找到该用户
		}else{
			count = 0;//没有这个用户
		}
				
		return count;
	}

	//根据用户的id来查找用户创建的文章
		@Override
		public List<Article> getArticleByUserId(int userId) {
		
			String sql = "SELECT * FROM article WHERE user_id="+userId;
			
			List<Article> list = dao.getArticleBySql(sql);
					
			return list;
		}

	
	
}
