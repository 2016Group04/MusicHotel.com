package com.service;

import java.util.List;

public interface AlbumService {

	//根据hotelId得到对应的全部歌曲
	public List<Integer> getMusicIdByHoteId(int hotelId);
}
