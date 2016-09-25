package com.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.dao.MusicDao;
import com.po.Music;
import com.service.MusicService;
@Service
public class MusicServiceImpl implements MusicService {
	@Autowired
	private MusicDao dao;
	
	public MusicServiceImpl(){
		System.out.println("创建了一个MusicServiceImpl对象");
	}
	

	
	@Override
	public int addMusic(Music music) {
		int count=dao.addMusic(music);
		return count;
	}

	@Override
	public int deleteMusic(int musicId) {
		int count=dao.deleteMusic(musicId);
		return count;
	}

	@Override
	public int updateMusic(Music music) {
	
		int count=dao.updateMusic(music);
		return count;
	}

	@Override
	public Music getMusicByMusicId(int musicId) {
		Music music=dao.getMusicByMusicId(musicId);
		return music;
	}
	
	public static void main(String[] args) {
		ApplicationContext context = new FileSystemXmlApplicationContext("WebRoot/WEB-INF/applicationContext.xml");
		MusicServiceImpl service=(MusicServiceImpl)context.getBean("musicService");
		Music music= new Music();
		
	}

}
