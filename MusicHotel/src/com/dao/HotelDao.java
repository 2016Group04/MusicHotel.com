package com.dao;

import java.util.List;

import com.po.Hotel;

public interface HotelDao {

	//增加
	public int addHotel(Hotel hotel);
	
	//删除
	public int deleteHotel(int hotelId);
	
	//修改
	public int updateHotel(Hotel hotel);
	
	//根据id查一个
	public Hotel getHotelById(Integer hotelId);
	
	//根据sql查
	public List<Hotel> getHotelBySql(String sql);
	
	//查询总共有多少条记录
	public int getTotalRecordSum(String sql);
	
	//点收藏后 likeSum+1
	public void addLikeSum(Integer hotelId);
	
	//点收藏后 likeSum+1
	public void deleteLikeSum(Integer hotelId);
	  	
	//得到最大的hotelId
	public int getMaxHotelId();
	//得到最小的hotelId
	public int getMinHotelId();
}
