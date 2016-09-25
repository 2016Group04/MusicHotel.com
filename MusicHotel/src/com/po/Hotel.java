package com.po;

import java.util.Date;

public class Hotel {

	private Integer hotelId;
	private String titile;
	private String coverImg;
	private Integer likeSum;
	private Integer commentSum;
	private Integer userId;
	private Date createDate;
	private String style;
	private String hotelDesc;
	
	public Integer getHotelId() {
		return hotelId;
	}
	public void setHotelId(Integer hotelId) {
		this.hotelId = hotelId;
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
	public Date getCreateDate() {
		return createDate;
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
		return "Hotel [hotelId=" + hotelId + ", titile=" + titile
				+ ", likeSum=" + likeSum + ", commentSum=" + commentSum
				+ ", userId=" + userId + ", createDate=" + createDate
				+ ", style=" + style + "]";
	}
}
