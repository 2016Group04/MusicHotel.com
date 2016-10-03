package com.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.page.PageInfo;
import com.po.Hotel;

public interface HotelService {

	//增加一个hotel
	public void addHotel(Hotel hotel);
	
	//根据id删除一个hotel
	public void deleteHotel(int hotelId);
	
	//根据id查一个
	public Hotel getHotelById(Integer hotelId);
		
	//查所有
	public List<Hotel> getAllHotel();
	
	//分页查
	public List<Hotel> getHotelByPage(PageInfo pageInfo);
	
	//查询总共有多少条记录
	public int getTotalRecordSum();
	
	//根据用户id来获取由用户创建的所有的hotel
	public List<Hotel> getHotelByUserId(int userId);
	
	//根据hotel的标题来获得hotel
	public Hotel getHotelByTitile(String titile);
	
	//上传hotel封面图片
	public Hotel upload(HttpServletRequest request,String productImagesUploadPath,String txtUploadPath,Date date);
}
