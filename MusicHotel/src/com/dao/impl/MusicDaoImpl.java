package com.dao.impl;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.dao.MusicDao;
import com.po.Music;

public class MusicDaoImpl implements MusicDao {

	private SqlSession session = null;
	
	
	
	public SqlSession getSession() {
		return session;
	}

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public int addMusic(Music music) {
		
		
		String statement = "com.po.musicMapper.addMusic";
		int count = session.insert(statement, music);
		return count;
		
	}

	@Override
	public int deleteMusic(int musicId) {
		
		String statement = "com.po.musicMapper.deleteMusicByMusicId";
		
		int count = session.delete(statement,musicId);
		return count;
	}

	@Override
	public int updateMusic(Music music) {
		
		int count = 0;
		
		return count;
	}

	@Override
	public Music getMusicByMusicId(int musicId) {

		String statement = "com.po.musicMapper.getMusicByMusicId";
		
		Music music = session.selectOne(statement, musicId);
		return music;
		
	}

	@Override
	public List<Music> getMusicBySql(String sql) {
		
		List<Music> list = new ArrayList<Music>();
		
		String statement = "com.po.musicMapper.getMusicBySql";
		list = session.selectList(statement, sql);
		
		return list;
	}

}
