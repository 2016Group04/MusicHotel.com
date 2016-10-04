package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AlbumDao;
import com.po.Album;
import com.service.AlbumService;
@Service
public class AlbumServiceImpl implements AlbumService{

	@Autowired
	private AlbumDao dao;
	//根据hotelId得到对应的全部歌曲
	@Override
	public List<Integer> getMusicIdByHoteId(int hotelId) {
		
		List<Integer> list = new ArrayList<Integer>();
		
		String sql = "SELECT * FROM album WHERE hotel_id=" + hotelId;
		List<Album> list1 = dao.getAlbumBySql(sql);
		
		for(Album album:list1){
			list.add(album.getMusicId());
		}
	
		return list;
	}
	
	
	//根据hotelId和musicId来给相应的hotel添加歌曲
	@Override
	public void addAlbum(int hotelId,int musicId){
		
		
			
			Album album = new Album();
			album.setHotelId(hotelId);
			album.setMusicId(musicId);
			
			dao.addAlbum(album);
		
		
	}

	
}
