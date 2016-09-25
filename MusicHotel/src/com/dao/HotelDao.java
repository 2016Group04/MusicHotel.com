package com.dao;

import java.util.List;

import com.po.Hotel;

public interface HotelDao {

	/*//增加
	public int addHotel(Hotel hotel);
	
	//删除
	public int deleteHotel(int hotelId);
	
	//修改
	public int updateHotel(Hotel hotel);*/
	
	//根据id查一个
	public Hotel getHotelById(Integer hotelId);
	
	//根据sql查
	public List<Hotel> getHotelBySql(String sql);
}
