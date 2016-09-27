package com.po;

import java.util.Date;


public class User {

	/*user_id INT PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(40),
	password_MD5 VARCHAR(32),
	nickname VARCHAR(20),
	profile_text VARCHAR(100),
	profile_img VARCHAR(20),
	signup_date DATE,
	listened_sum INT,
	account_qq VARCHAR(15),
	account_weibo VARCHAR(40),
	account_douban VARCHAR(40),
	gender VARCHAR(2),
	age INT,
	address VARCHAR(20),
	occupation VARCHAR(10),
	auto_play INT DEFAULT 1  #1自动播放*/
	
	private int userId;
	private String email;
	private String passwordMD5;
	private String nickname;
	private String profileText;
	private String profileImg;
	private Date signupDate;
	private int listenedSum;
	private String accountQq;
	private String accountWeibo;
	private String accountDouban;
	private String gender;
	private int age;
	private String address;
	private String occupation;
	private int autoPlay;
	private int isValited;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswordMD5() {
		return passwordMD5;
	}
	public void setPasswordMD5(String passwordMD5) {
		this.passwordMD5 = passwordMD5;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getProfileText() {
		return profileText;
	}
	public void setProfileText(String profileText) {
		this.profileText = profileText;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public Date getSignupDate() {
		return signupDate;
	}
	public void setSignupDate(Date signupDate) {
		this.signupDate = signupDate;
	}
	public int getListenedSum() {
		return listenedSum;
	}
	public void setListenedSum(int listenedSum) {
		this.listenedSum = listenedSum;
	}
	public String getAccountQq() {
		return accountQq;
	}
	public void setAccountQq(String accountQq) {
		this.accountQq = accountQq;
	}
	public String getAccountWeibo() {
		return accountWeibo;
	}
	public void setAccountWeibo(String accountWeibo) {
		this.accountWeibo = accountWeibo;
	}
	public String getAccountDouban() {
		return accountDouban;
	}
	public void setAccountDouban(String accountDouban) {
		this.accountDouban = accountDouban;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public int getAutoPlay() {
		return autoPlay;
	}
	public void setAutoPlay(int autoPlay) {
		this.autoPlay = autoPlay;
	}
	
	
	public int getIsValited() {
		return isValited;
	}
	public void setIsValited(int isValited) {
		this.isValited = isValited;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", email=" + email + ", passwordMD5="
				+ passwordMD5 + ", nickname=" + nickname + ", profileText="
				+ profileText + ", profileImg=" + profileImg + ", signupDate="
				+ signupDate + ", listenedSum=" + listenedSum + ", accountQq="
				+ accountQq + ", accountWeibo=" + accountWeibo
				+ ", accountDouban=" + accountDouban + ", gender=" + gender
				+ ", age=" + age + ", address=" + address + ", occupation="
				+ occupation + ", autoPlay=" + autoPlay + ", isValited="
				+ isValited + "]";
	}
	
	
}
