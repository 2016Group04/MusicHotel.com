package com.dao;

import java.util.List;

import com.po.Hotel;

public interface HotelDao {

	//根据id查一个
	public Hotel getHotelById(Integer hotelId);
	
	//根据sql查
	public List<Hotel> getHotelBySql(String sql);
}
