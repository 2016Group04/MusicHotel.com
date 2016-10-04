package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;

import com.google.gson.Gson;
import com.po.Music;
import com.service.impl.AlbumServiceImpl;
import com.service.impl.MusicServiceImpl;

@Controller
@RequestMapping("/JSP")
public class MusicController implements ServletConfigAware,
ServletContextAware{

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
	
	@RequestMapping("/addMusic.action")
	public void addMusic(HttpServletRequest request){
		
		System.out.println("in addMusic");
		
		String target = "";
		
		String realpath = servletContext.getRealPath("");
		String txtPath = realpath + "//JSP//music";
		
		List<Integer> list = musicService.upload(request, txtPath);
		
		albumService.addAlbum(list.get(0), list.get(1));
		
	
	}
	
}
