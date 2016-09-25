package com.service;

import java.util.List;

import com.po.Hotel;

public interface HotelService {

	//根据id查一个
	public Hotel getHotelById(Integer hotelId);
		
	//查所有
	public List<Hotel> getAllHotel();
}
