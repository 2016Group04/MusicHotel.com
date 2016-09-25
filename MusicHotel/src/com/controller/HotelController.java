package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.po.Hotel;
import com.service.impl.HotelServiceImpl;

@Controller
public class HotelController {

	@Autowired
	private HotelServiceImpl hotelService;
	
	//根据id查一个
	@RequestMapping("")
	public void getHotelById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//一.填充数据
		//二.调用业务逻辑
		//三.转发视图
	}
	
	//查所有
	@RequestMapping("JSP/getAllHotel.action")
	public void getAllHotel(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//一.填充数据
		//二.调用业务逻辑
		List<Hotel> list = hotelService.getAllHotel();
		//三.转发视图
		String target = "allHotels.jsp";
		request.setAttribute("list", list);
		request.getRequestDispatcher(target).forward(request, response);
	}
}
