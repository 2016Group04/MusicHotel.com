package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.po.Music;
import com.po.User;
import com.service.impl.AlbumServiceImpl;
import com.service.impl.MusicServiceImpl;

@Controller
@RequestMapping("/JSP")
public class MusicController {

	@Autowired
	private MusicServiceImpl musicService;
	
	@Autowired
	private AlbumServiceImpl albumService;
	
	/**
	 * 功能：根据hotelId得到其下的所有的音乐
	 * @param HotelId
	 */
	@RequestMapping("/getAllMusic.action")
	public void getAllMusic(int hotelId,HttpServletResponse response)
		throws IOException{
		
		System.out.println("in getAllMusic");
		
		List<Integer> list = albumService.getMusicIdByHoteId(hotelId);
		List<Music> list2 = musicService.getMusicByMusicId(list);
		
		Gson gson = new Gson();
		String json = gson.toJson(list2);
		System.out.println(json);
		
		PrintWriter out = response.getWriter();
		out.write(json);
		out.flush();
		
	}
	
}
