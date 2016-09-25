package com.dao;

import java.util.List;

import com.po.Article;

public interface ArticleDao {
	
	//增加文章
	public int addArticle(Article article);
	
	//删除文章
	public int deleteArticle(int articleId);
	
	//修改文章
	public int updateArticle(Article article);
	
	//根据Id查
	public Article getArticleByArticleId(int articleId);
	
	//根据sql查
	public List<Article> getArticleBySql(String sql);
}
