package com.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.po.Music;

public interface MusicService {

	// 添加
	public int addMusic(Music music);

	// 删除
	public int deleteMusic(Music music, String path);

	// 更新
	public int updateMusic(Music music);

	// 根据MusicId来查找
	public List<Music> getMusicByMusicId(List<Integer> list);

	// 根据MusicId来查找
	public Music getMusicByMusicId(int musicId);

	// 上传音乐文件,返回音乐名
	public int upload(HttpServletRequest request,
			Music music, int hotelId, MultipartFile file);

	// 根据音乐文件的名字来得到music
	public Music getMusicByPath(String path);

	// 删除列表中的所有的歌曲
	public void deleteMusicByList(List<Integer> list, String path);

	public int ifExist(Music music);

	public void uploadOneMusic(Music music, HttpServletRequest request,
			MultipartFile file);

}
