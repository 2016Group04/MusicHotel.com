package com.po;

public class Album {

	
	/*album_id INT PRIMARY KEY AUTO_INCREMENT,
	hotel_id INT,			#音乐旅馆编号
	music_id INT			#音乐编号*/
	
	
	private int albumId;
	private int hotelId;
	private int musicId;
	public int getAlbumId() {
		return albumId;
	}
	public void setAlbumId(int albumId) {
		this.albumId = albumId;
	}
	public int getHotelId() {
		return hotelId;
	}
	public void setHotelId(int hotelId) {
		this.hotelId = hotelId;
	}
	public int getMusicId() {
		return musicId;
	}
	public void setMusicId(int musicId) {
		this.musicId = musicId;
	}
	@Override
	public String toString() {
		return "Album [albumId=" + albumId + ", hotelId=" + hotelId
				+ ", musicId=" + musicId + "]";
	}
	
}
