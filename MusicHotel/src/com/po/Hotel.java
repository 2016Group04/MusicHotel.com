package com.po;

import java.util.Date;

import com.util.DateFormat;

public class Hotel {

	private Integer hotelId;
	private String title;
	private String coverImg;
	private Integer likeSum;
	private Integer commentSum;
	private Integer userId;
	private Date createDate;
	private String style;
	private String hotelDesc;
	
	private Date likeDate;
	
	
	public String getLikeDate() {
		return DateFormat.dateFormat(likeDate);
	}
	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}
	
	public Integer getHotelId() {
		return hotelId;
	}
	public void setHotelId(Integer hotelId) {
		this.hotelId = hotelId;
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
	public Integer getLikeSum() {
		return likeSum;
	}
	public void setLikeSum(Integer likeSum) {
		this.likeSum = likeSum;
	}
	public Integer getCommentSum() {
		return commentSum;
	}
	public void setCommentSum(Integer commentSum) {
		this.commentSum = commentSum;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getCreateDate() {
		return DateFormat.dateFormat(createDate);
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	public String getHotelDesc() {
		return hotelDesc;
	}
	public void setHotelDesc(String hotelDesc) {
		this.hotelDesc = hotelDesc;
	}
	
	@Override
	public String toString() {
		return "Hotel [hotelId=" + hotelId + ", title=" + title
				+ ", coverImg=" + coverImg + ", likeSum=" + likeSum
				+ ", commentSum=" + commentSum + ", userId=" + userId
				+ ", createDate=" + createDate + ", style=" + style
				+ ", hotelDesc=" + hotelDesc + ", likeDate=" + likeDate + "]";
	}
}
