package com.dao;

import java.util.List;

import com.po.Music;

public interface MusicDao {
	
	//增加一个用户
	public int addMusic(Music music);
	
	//删除一个用户
	public int deleteMusic(int musicId);
	
	//修改用户信息
	public int updateMusic(Music music);
	
	//根据用户的useId来查找用户
	public Music getMusicByMusicId(int musicId);
	
	//根据sql来查找用户
	public List<Music> getMusicBySql(String sql);
}
