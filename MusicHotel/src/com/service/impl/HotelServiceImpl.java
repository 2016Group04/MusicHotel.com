package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HotelDao;
import com.po.Hotel;
import com.service.HotelService;

@Service
public class HotelServiceImpl implements HotelService {

	@Autowired
	private HotelDao hotelDao;
	
	//根据id查一个
	@Override
	public Hotel getHotelById(Integer hotelId) {
		Hotel hotel = null;
		hotel = hotelDao.getHotelById(hotelId);
		return hotel;
	}

	//根据sql查
	@Override
	public List<Hotel> getAllHotel() {
		List<Hotel> list = null;
		String sql = "SELECT * FROM hotel";
		list = hotelDao.getHotelBySql(sql);
		return list;
	}

}
