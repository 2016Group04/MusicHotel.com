package com.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.dao.MusicDao;
import com.po.Music;

public class MusicDaoImpl implements MusicDao {

	private SqlSession session;
	
	public SqlSession getSession() {
		
		return session;
	}
	
	public void setSession(SqlSession session) {
		System.out.println("使用set方法把session注入到MusicDaoImpl对象");
		this.session = session;
	}

	public MusicDaoImpl(){
		System.out.println("创建了一个MusicDaoImpl对象");
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
		
		String statement="com.po.musicMapper.updateMusic";
		
		
		int count = session.update(statement, music);
		
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

	public static void main(String[] args) {
		ApplicationContext context = new FileSystemXmlApplicationContext("WebRoot/WEB-INF/applicationContext.xml");
		MusicDaoImpl dao=(MusicDaoImpl)context.getBean("musicDaoImpl");
		Music music= new Music();
		
	}

}
