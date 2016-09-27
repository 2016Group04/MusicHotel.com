package com.service;

import java.util.List;

import com.page.PageInfo;
import com.po.Hotel;

public interface HotelService {

	//根据id查一个
	public Hotel getHotelById(Integer hotelId);
		
	//查所有
	public List<Hotel> getAllHotel();
	
	//分页查
	public List<Hotel> getHotelByPage(PageInfo pageInfo);
	
	//查询总共有多少条记录
	public int getTotalRecordSum();
}
