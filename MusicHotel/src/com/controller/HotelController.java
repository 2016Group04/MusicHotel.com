package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.page.PageInfo;
import com.po.Hotel;
import com.service.impl.HotelServiceImpl;

@Controller
public class HotelController {

	@Autowired
	private HotelServiceImpl hotelService;
	
	//根据id查一个
	@RequestMapping("JSP/getHotelById.action")
	public String getHotelById(Model model,String hotelId){
		//一.填充数据
		System.out.println(hotelId);
		//二.调用业务逻辑
		Hotel hotel = hotelService.getHotelById(Integer.parseInt(hotelId));
		//三.转发视图
		String target = "oneHotel.jsp";
		model.addAttribute("hotel", hotel);
		return target;
	}
	
	//分页查
	@RequestMapping("JSP/getHotelByPage.action")
	public String getHotelByPage(Model model,String requestPage){
		//一.填充数据
		PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
		//二.调用业务逻辑
		int totalRecordSum = hotelService.getTotalRecordSum();
		pageInfo.setTotalRecordCount(totalRecordSum);
		
		List<Hotel> list = hotelService.getHotelByPage(pageInfo);
		//三.转发视图
		String target = "allHotels.jsp";
		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);
		return target;
	}
}
