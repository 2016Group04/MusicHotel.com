package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;

import com.google.gson.Gson;
import com.page.PageInfo;
import com.po.Hotel;
import com.po.User;
import com.service.impl.AlbumServiceImpl;
import com.service.impl.HotelServiceImpl;
import com.service.impl.MusicServiceImpl;
import com.service.impl.UserLikeServiceImpl;
import com.util.WriteFile;

@Controller
public class HotelController  implements ServletConfigAware,
ServletContextAware{

	@Autowired
	private HotelServiceImpl hotelService;
	
	@Autowired
	private AlbumServiceImpl albumService;
	
	@Autowired
	private MusicServiceImpl musicService;
	
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

	
	//根据id查一个
	@RequestMapping("JSP/getHotelById.action")
	public String getHotelById(Model model,String hotelId){
		//一.填充数据
		//二.调用业务逻辑
		Hotel hotel = hotelService.getHotelById(Integer.parseInt(hotelId));
			
		int maxHotelId = hotelService.getMaxHotelId();
		int minHotelId = hotelService.getMinHotelId();
		//三.转发视图
		String target = "oneHotel.jsp";
		model.addAttribute("hotel", hotel);
		model.addAttribute("maxHotelId", maxHotelId);
		model.addAttribute("minHotelId", minHotelId);
		return target;
		}
	
	//分页查
		@RequestMapping("JSP/getHotelByPage.action")
		public String getHotelByPage(Model model,String requestPage){
			//一.填充数据
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage),5);
			//二.调用业务逻辑
			int totalRecordSum = hotelService.getTotalRecordSum();
			pageInfo.setTotalRecordCount(totalRecordSum);
			
			List<Hotel> list = hotelService.getHotelByPage(pageInfo);
			
			List<Hotel> hotHotelList = hotelService.getHotHotel();
			//三.转发视图
			String target = "allHotels.jsp";
			model.addAttribute("list", list);
			model.addAttribute("hotHotelList", hotHotelList);
			model.addAttribute("pageInfo", pageInfo);
			return target;
		}
	
	@RequestMapping("/JSP/getMyHotel.action")
	public String getMyHotel(HttpServletRequest request,ModelMap model){
		
		System.out.println("in getMyHotel");
		HttpSession session = request.getSession();
		
		User user = (User)session.getAttribute("user");
		
		int userId = user.getUserId();
		String target = "";
		
		List<Hotel> list = hotelService.getHotelByUserId(userId);
		
		Hotel hotel = new Hotel();
		
		list.add(hotel);
		
		model.addAttribute("list",list);
		
		target = "myHomePageHotel.jsp";
		
		return target;
	}
	
	//删除我添加的hotel
	@RequestMapping("/JSP/deleteMyHotel.action")
	public String deleteMyHotel(int hotelId){
		
		String target = "";
		System.out.println("in deleteMyHotel");
		
		String realpath = servletContext.getRealPath("");
		String musicPath = realpath + "//JSP//music";
		
		hotelService.deleteHotel(hotelId);
		
		//删除的时候把对应的歌曲删除
		List<Integer> list = albumService.getMusicIdByHoteId(hotelId);
		
		albumService.deleteAlbumByHotelId(hotelId);
		System.out.println("删除列表==="+list);
		
		//删除所有的歌曲
		musicService.deleteMusicByList(list,musicPath);
		
		//删除用户喜爱列表中的歌曲
		
		
		//userLikeService.deleteUserLikeByList(list);
		
		
		target = "getMyHotel.action";
		
		return target;
	}
	//添加一个新的hotel
	@RequestMapping("/JSP/addMyHotel.action")
	public String addMyHotel(ModelMap model,HttpServletRequest request,int userId){
		
		String realpath = servletContext.getRealPath("");
		String txtPath = realpath + "//JSP//txt//hotel";
		String imgPath = realpath + "//JSP//img//hotel";
		
		System.out.println("in addMyHotel");
		
		
		String target = "";
		
		Date date = new Date();
		
		
		Hotel hotel = hotelService.upload(request, imgPath,txtPath,date,userId);
		
		String[] hotelDesc = WriteFile.fileReader(txtPath+"//"+hotel.getHotelDesc());
		
		/*for(String s:hotelDesc){
			System.out.println("hl==="+hotelDesc);
		}*/
		
		String style = hotel.getStyle();
		
		String[] styleArr = style.split(",");
		
		model.addAttribute("hotel",hotel);
		model.addAttribute("style",styleArr);
		model.addAttribute("hotelDesc",hotelDesc);
		
		
		target = "addMusic.jsp";
		
		return target;
	}
	
	//检查hotel标题是否重复
	@RequestMapping("/JSP/checkHotelTitle.action")
	public void checkHotelTitle(String titile,HttpServletResponse response)
		throws Exception{
		
		System.out.println("in checkHotelTitle");
		
		Hotel hotel = hotelService.getHotelByTitile(titile);
		
		PrintWriter out = response.getWriter();
		System.out.println(hotel==null);
		if(hotel==null){
			out.write("0");//不存在相同标题
		}else{
			out.write("1");//存在相同的标题
		}
		
		out.flush();
	}
	
	@RequestMapping("JSP/addLikeSum.action")
	public void addLikeSum(HttpServletResponse response,String hotelId){
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//一.填充数据
		//二.调用业务逻辑
		hotelService.addLikeSum(Integer.parseInt(hotelId));
		Gson gson = new Gson();
		String json = gson.toJson("收藏成功");
		//三.输出
		out.println(json);
		out.flush();
	}
	
}
