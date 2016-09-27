package com.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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
	public List<Music> getMusicByMusicId(List<Integer> list) {
		
		List<Music> list1 = new ArrayList<Music>();
		
		Iterator<Integer> i = list.iterator();
		while(i.hasNext()){
			Integer in = i.next();
			Music music = dao.getMusicByMusicId(in);
			list1.add(music);
		}
		
		return list1;
	}
	
	public static void main(String[] args) {
		ApplicationContext context = new FileSystemXmlApplicationContext("WebRoot/WEB-INF/applicationContext.xml");
		MusicServiceImpl service=(MusicServiceImpl)context.getBean("musicService");
		Music music= new Music();
		
	}

}
