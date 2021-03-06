package com.po;

import java.util.Date;

import com.util.DateFormat;

public class Music {
	
	private Integer musicId;
	private String title;
	private String coverImg;
	private String artist;
	private String path;
	private String lyrics;
	private String size;
	private String timeLength;
	private String genre;
	private String album;
	
	public int getMusicId() {
		return musicId;
	}
	public void setMusicId(Integer musicId) {
		this.musicId = musicId;
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
	
	
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getAlbum() {
		return album;
	}
	public void setAlbum(String album) {
		this.album = album;
	}
	@Override
	public String toString() {
		return "Music [musicId=" + musicId + ", title=" + title
				+ ", coverImg=" + coverImg + ", artist=" + artist + ", path="
				+ path + ", lyrics=" + lyrics + ", size=" + size
				+ ", timeLength=" + timeLength + ", genre=" + genre
				+ ", album=" + album + "]";
	}
	
	

}
