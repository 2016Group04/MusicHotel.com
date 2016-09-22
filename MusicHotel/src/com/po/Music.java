package com.po;

public class Music {
	
	private int musicId;
	private String titile;
	private String coverImg;
	private String artist;
	private String path;
	private String lyrics;
	private String size;
	private String timeLength;
	public int getMusicId() {
		return musicId;
	}
	public void setMusicId(int musicId) {
		this.musicId = musicId;
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
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getLyrics() {
		return lyrics;
	}
	public void setLyrics(String lyrics) {
		this.lyrics = lyrics;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getTimeLength() {
		return timeLength;
	}
	public void setTimeLength(String timeLength) {
		this.timeLength = timeLength;
	}
	@Override
	public String toString() {
		return "Music [musicId=" + musicId + ", titile=" + titile
				+ ", coverImg=" + coverImg + ", artist=" + artist + ", path="
				+ path + ", lyrics=" + lyrics + ", size=" + size
				+ ", timeLength=" + timeLength + "]";
	}
	
	

}
