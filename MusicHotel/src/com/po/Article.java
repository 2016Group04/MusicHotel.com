package com.po;

import java.util.Date;

import com.util.DateFormat;

public class Article {
	private int articleId;      //文章编号
	private int userId;			//作者  用户编号
	private String writer;
	private String title;		//文章标题
	private String coverImg;	//文章的封面 在文章列表里显示
	private String articleDate;	//文章发表的日期
	private int musicId;		//文章背景音乐的id
	private Music music;	
	private String brief;		//文章简介
	private String content;		//文章内容   doc文件名
	private int likeSum;		//点赞数
	
	public int getLikeSum() {
		return likeSum;
	}
	public void setLikeSum(int likeSum) {
		this.likeSum = likeSum;
	}
	
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
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String titile) {
		this.title = titile;
	}
	public String getCoverImg() {
		return coverImg;
	}
	public void setCoverImg(String coverImg) {
		this.coverImg = coverImg;
	}
	public String getArticleDate() {
		return articleDate;
	}
	public void setArticleDate(String articleDate) {
		this.articleDate = articleDate;
	}
	public int getMusicId() {
		return musicId;
	}
	public void setMusicId(int musicId) {
		this.musicId = musicId;
	}
	
	public Music getMusic() {
		return music;
	}
	public void setMusic(Music music) {
		this.music = music;
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
		return "Article [articleId=" + articleId + ", writer=" + writer
				+ ", title=" + title + ", coverImg=" + coverImg
				+ ", articleDate=" + articleDate + ", music=" + music
				+ ", brief=" + brief + ", content=" + content + ", likeSum="
				+ likeSum + "]";
	}
	
	
}
