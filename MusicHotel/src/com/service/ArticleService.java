package com.service;

import java.util.List;

import com.page.PageInfo;
import com.po.Article;

public interface ArticleService {

	// 添加文章
	public int addArticle(Article article);

	// 删除文章
	public int deleteArticle(int articleId);

	// 更改文章
	public int updateArticle(Article article);

	// 根据文章Id查找
	public Article getArticleByArticleId(int articleId);

	// 根据作者查找
	public int getArticleByQuery(String account);

	// 根据用户的id来查找用户创建的文章
	public List<Article> getArticleByUserId(int userId);

	public List<Article> getAllArticle();

	public List<Article> getAllArticleByPage(PageInfo pageInfo);

}
