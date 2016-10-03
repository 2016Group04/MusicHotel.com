package com.po;

import com.util.MD5;



public class Administrator {
		
	private int id;
	private int type;
	private String name;
	private String password;
	private String profileImg;
	private String email;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		
		this.password = MD5.getHash(password);
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "Administrator [id=" + id + ", type=" + type + ", name=" + name
				+ ", password=" + password + ", profileImg=" + profileImg
				+ ", email=" + email + "]";
	}
	
	
	
}
