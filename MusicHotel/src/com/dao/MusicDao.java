package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.po.Music;
@Repository
public interface MusicDao {
	
	//增加一个音乐
	public int addMusic(Music music);
	
	//删除一个音乐
	public int deleteMusic(int musicId);
	
	//修改音乐信息
	public int updateMusic(Music music);
	
	//根据音乐的Id来查找用户
	public Music getMusicByMusicId(Integer musicId);
	
	//根据sql来查找音乐
	public List<Music> getMusicBySql(String sql);

	
	public int ifExist(Music music);
	
	
}
