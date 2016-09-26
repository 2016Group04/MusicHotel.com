package com.service;


import com.po.Music;

public interface MusicService {
	
	
	//添加
	public int addMusic(Music music);
	
	//删除
	public int deleteMusic(int musicId);
	
	//更新
	public int updateMusic(Music music);
	
	//根据MusicId来查找
	public Music getMusicByMusicId(int musicId);
	
	
	
}