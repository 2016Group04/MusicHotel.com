package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.po.Album;
@Repository
public interface AlbumDao {

	//添加一个歌单
	public int addAlbum(Album album);
	
	//删除一个歌单
	public int deleteAlbum(Album album);
	
	//使用sql语句查询album表
	public List<Album> getAlbumBySql(String sql);
}