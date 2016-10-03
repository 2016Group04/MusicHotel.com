package com.po;

import java.util.Date;

import com.util.DateFormat;

public class Article {
	private int articleId;      //文章编号
	private int userId;			//作者  用户编号
	private String titile;		//文章标题
	private String coverImg;	//文章的封面 在文章列表里显示
	private Date articleDate;	//文章发表的日期
	private int musicId;		//文章背景音乐的id
	private String brief;		//文章简介
	private String content;		//文章内容   doc文件名
	/*article_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,			#作者  用户编号
	titile VARCHAR(20),		#
	cover_img VARCHAR(60),	#文章的封面 在文章列表里显示
	article_date DATETIME,	#文章发表的日期
	music_id INT,			#文章背景音乐的id
	brief VARCHAR(500),
	content VARCHAR(60)	#文章内容   doc文件名*/
	
	private Date likeDate;
	
	
	public String getLikeDate() {
		return DateFormat.dateFormatLong(likeDate);
	}
	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getTitile() {
		return titile;
	}
	public void setTitile(String titile) {
		this.titile = titile;
	}
	public String getCoverImg() {
		return coverImg;
	}
	public void setCoverImg(String coverImg) {
		this.coverImg = coverImg;
	}
	public String getArticleDate() {
		String date = DateFormat.dateFormatLong(articleDate);
		System.out.println("date==========="+date);
		return date;
	}
	public void setArticleDate(Date articleData) {
		this.articleDate = articleData;
	}
	public int getMusicId() {
		return musicId;
	}
	public void setMusicId(int musicId) {
		this.musicId = musicId;
	}
	public String getBrief() {
		return brief;
	}
	public void setBrief(String brief) {
		this.brief = brief;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	@Override
	public String toString() {
		return "Article [articleId=" + articleId + ", userId=" + userId
				+ ", titile=" + titile + ", coverImg=" + coverImg
				+ ", articleData=" + articleDate + ", musicId=" + musicId
				+ ", brief=" + brief + ", content=" + content + "]";
	}
	
	
}
