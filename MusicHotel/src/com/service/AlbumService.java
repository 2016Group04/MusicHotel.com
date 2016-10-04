package com.service;

import java.util.List;

public interface AlbumService {

	//根据hotelId得到对应的全部歌曲
	public List<Integer> getMusicIdByHoteId(int hotelId);
	
	//根据hotelId和musicId列表来给相应的hotel添加歌曲
	public void addAlbum(int hotelId,int musicId);
	
	//根据hotelId删除所有的album记录
	public void deleteAlbumByHotelId(int hotelId);
}
