package com.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;

import com.po.Article;
import com.po.Hotel;
import com.po.Music;
import com.po.User;
import com.po.UserLike;
import com.service.impl.ArticleServiceImpl;
import com.service.impl.HotelServiceImpl;
import com.service.impl.MusicServiceImpl;
import com.service.impl.UserLikeServiceImpl;
import com.util.WriteFile;

@Controller
@RequestMapping("/JSP")
public class UserLikeController implements ServletConfigAware,
ServletContextAware{

	@Autowired
	private MusicServiceImpl musicService;
	
	@Autowired
	private HotelServiceImpl hotelService;
	
	@Autowired
	private ArticleServiceImpl articleService;
	
	@Autowired
	private UserLikeServiceImpl userLikeService;
	
	
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
	
	@RequestMapping("/getAllUserLiked.action")
	public String getAllUserLiked(HttpServletRequest request,String likeType,ModelMap model){
		
		System.out.println("in getAllUserLiked");
		String target = "";
		
		User user = (User)request.getSession().getAttribute("user");
		List<UserLike> list = userLikeService.getUserLikesByUserId(user.getUserId());
		
		List<Music> listMusic = new ArrayList<Music>();
		List<Hotel> listHotel = new ArrayList<Hotel>();
		List<Article> listArticle = new ArrayList<Article>();
		
		
		Iterator<UserLike> i = list.iterator();
		
		while(i.hasNext()){
			
			UserLike userLike = i.next();
			if("music".equals(userLike.getLikeType())){
				Music music = musicService.getMusicByMusicId(userLike.getLikeToId());
				if(music==null){
					music = new Music();
					music.setMusicId(userLike.getLikeToId());
				}else{
					
					if("/music/coverImg/default.jpg".equals(music.getCoverImg())){
						
						
					}else{
						String realpath = servletContext.getRealPath("");
						//把base64读进来
						String cover = WriteFile.baseReader(realpath+"//JSP//music//"+music.getCoverImg());
						music.setCoverImg(cover);
					}
				}
				
				listMusic.add(music);
			}else if("hotel".equals(userLike.getLikeType())){
				Hotel hotel  =hotelService.getHotelById(userLike.getLikeToId());
				if(hotel==null){//表示作者已删除该hotel
					
					hotel = new Hotel();
					hotel.setHotelId(userLike.getLikeToId());
				}
				
				hotel.setLikeDate(userLike.getLikeDate());
				listHotel.add(hotel);
			}else if("article".equals(userLike.getLikeType())){
				Article article = articleService.getArticleByArticleId(userLike.getLikeToId());
				if(article==null){//作者删除该文章
					article = new Article();
					article.setArticleId(userLike.getLikeToId());
				}
				
				article.setLikeDate(userLike.getLikeDate());
				listArticle.add(article);
			}
		}
		
		
		if("music".equals(likeType)){
			
			model.addAttribute("list",listMusic);
			target = "myHomePageMusicLiked.jsp";
		}else if("hotel".equals(likeType)){
			
			model.addAttribute("list",listHotel);
			target = "myHomePageHotelLiked.jsp";
		}else if("article".equals(likeType)){
			
			model.addAttribute("list",listArticle);
			target = "myHomePageArticleLiked.jsp";
		}
		
		return target;
	}
	
	@RequestMapping("/deleteUserLike.action")
	public String deleteUserLikeMusic(int id,String likeType){
		
		System.out.println("in deleteUserLike");

		String target = "";
		
		UserLike userLike = userLikeService.getUserLikeByLikeToId(id, likeType);
		
		userLikeService.deleteUserLike(userLike.getId());
		
		target = "getAllUserLiked.action";
		
		return target;
	}
}
