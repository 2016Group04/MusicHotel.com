package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.po.Album;
import com.po.Music;
import com.service.impl.AlbumServiceImpl;
import com.service.impl.MusicServiceImpl;
import com.util.WriteFile;

@Controller
public class MusicController implements ServletConfigAware, ServletContextAware {

	@Autowired
	private MusicServiceImpl musicService;

	@Autowired
	private AlbumServiceImpl albumService;

	private ServletContext servletContext;

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	private ServletConfig servletConfig;

	@Override
	public void setServletConfig(ServletConfig servletConfig) {
		this.servletConfig = servletConfig;
	}

	/**
	 * 功能：根据hotelId得到其下的所有的音乐
	 * 
	 * @param HotelId
	 */
	@RequestMapping("/JSP/getAllMusic.action")
	public void getAllMusic(int hotelId, HttpServletResponse response)
			throws IOException {

		System.out.println("in getAllMusic");
		System.out.println(hotelId);
		List<Integer> list = albumService.getMusicIdByHoteId(hotelId);
		List<Music> list2 = musicService.getMusicByMusicId(list);

		Iterator<Music> i = list2.iterator();

		while (i.hasNext()) {
			Music music = i.next();

			if ("music/coverImg/default.jpg".equals(music.getCoverImg())) {
				
			}else {
				String realpath = servletContext.getRealPath("");
				// 把base64读进来
				String cover = WriteFile.baseReader(realpath + "//JSP//music//"
						+ music.getCoverImg());
				System.out.println(cover);
				music.setCoverImg(cover);
			}
		}

		Gson gson = new Gson();
		String json = gson.toJson(list2);
		System.out.println(json);

		PrintWriter out = response.getWriter();
		out.write(json);
		out.flush();

	}

	@RequestMapping("/JSP/addMusic.action")
	public void addMusic(HttpServletRequest request,HttpServletResponse response,
			Music music, int hotelId, @RequestParam("file1") MultipartFile file) throws Exception {

		System.out.println("in addMusic");
		
		System.out.println("hotelId===" + hotelId);

		int musicId = musicService.upload(request, music, hotelId, file);
		System.out.println("musicId====="+musicId);
		music.setMusicId(musicId);
		System.out.println("music===" + music);
		albumService.addAlbum(hotelId, musicId);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("musicId", musicId);

		PrintWriter out = response.getWriter();
		out.print(musicId);
		out.flush();
	}

	@RequestMapping("/JSP/deleteMusic.action")
	public void deleteMusic(int musicId, int hotelId) {

		System.out.println("in deleteMusic");

		String realpath = servletContext.getRealPath("");
		String txtPath = realpath + "//JSP//music";

		// 先删除歌曲

		Music music = musicService.getMusicByMusicId(musicId);

		musicService.deleteMusic(music, txtPath);

		Album album = new Album();
		album.setHotelId(hotelId);
		album.setMusicId(musicId);
		albumService.deleteAlbum(album);

	}

}
